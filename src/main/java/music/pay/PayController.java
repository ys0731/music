package music.pay;

import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import music.qna.QnaVo;
import music.user.UserVo;





@Controller
public class PayController {
	
	@Autowired
	PayService service;
	
	
	private IamportClient api;
	
	public PayController() {
    	// REST API , REST API secret
		this.api = new IamportClient("4368432431296351","sGcFdqkDJ0tbnKAHRODtcdErvTFeHFqalCPz39cNaFZypAfhoTLB7p2CiHQZnh9JUZiX9uLjaKRAk7RJ");				
	}
		
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model,Locale locale,HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
			return api.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping("/pay/payment.do")
	public String payment(PayVo vo,Model model, HttpSession sess,UserVo uv, @RequestParam String ticket_type, @RequestParam int time, @RequestParam int no) {	
		
		vo.setTicket_type(ticket_type);
		vo.setTime(time);
		vo.setTicket_no(no);
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getNo());
		int r = service.insert(vo);
		
		if( r >0) {
			model.addAttribute("msg", "true");
		}else {
			model.addAttribute("msg", "false");
		}
		return "include/result";
	}
	
	//이용권 결제내역
	@RequestMapping("/pay/view.do")
	public String view(PayVo vo, HttpSession sess,Model model) {	
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getNo());
		model.addAttribute("list",service.selectAll(vo));
		return "ticket/view";
	}	
	
	//이용권 삭제 
	@RequestMapping("/pay/delete.do") 
	public String delete(Model model,PayVo vo,@RequestParam(value="chbox[]") List<String> chArr) {
		
		int r = 0;
		int no = 0;
		
		for(String i : chArr) {
			no = Integer.parseInt(i);
			vo.setNo(no);
			r = service.delete(vo);
		}
		
		if(r>0) {
			model.addAttribute("msg","true");
		}else {
			model.addAttribute("msg","false");
		}		
		return "/admin/include/result";
	}
	
	
		
}
