package music.main;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import music.admin.album.AdminAlbumService;
import music.admin.album.AdminAlbumVo;
import music.admin.mv.AdminMvService;
import music.admin.mv.AdminMvVo;
import music.chart.ChartService;
import music.chart.ChartVo;
import music.mvChart.MvChartService;
import music.mvChart.MvChartVo;
import music.notice.NoticeService;
import music.notice.NoticeVo;
import music.recommend.RecommendService;
import music.recommend.RecommendVo;
import music.search.SearchService;
import music.search.SearchVo;

@Controller
public class MainController {

	@Autowired
	ChartService cservice;
	
	@Autowired
	AdminAlbumService alservice;
	
	@Autowired
	SearchService sservice;
	
	@Autowired
	NoticeService nservice;
	
	@Autowired
	RecommendService rservice;
	
	@Autowired
	MvChartService mservice;
	
	//메인 페이지
	@RequestMapping("/index.do")
	public String index(Model model, ChartVo cv, AdminAlbumVo av, HttpSession sess, SearchVo sv, NoticeVo nv,MvChartVo mv ) {		
		model.addAttribute("av",alservice.selectAllAlbums(av)); //앨범		
		model.addAttribute("cv",cservice.ChartList_24hits(cv)); //차트		
		model.addAttribute("nv",nservice.selectAll(nv));

		RecommendVo rv = new RecommendVo();
		model.addAttribute("rv", rservice.selectTodayList(rv)); //추천음악		
		model.addAttribute("mv", mservice.RecentMv(mv));

		return "index";
		}
}
