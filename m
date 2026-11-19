Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076677;
	b=ds82osSIQINXEjurvkIPb4jjE++kS3rLzds5nzzxHy0x1wo+h+POxwOq239aSVUdR43b
	 ME/69yIljkW6xpXsvwN3/H1hb4JyoCe1edGoijqOXciT/vVbcb7Hc4QW10YWNoyYLPnYj
	 FDz1n+c8gUMi0n3B8+Om2LVuJ5pbvTdyxGM9Bl0WRebiT0EaVnGMtIopS7QZu+ojGuB3V
	 2Md8xaX8S8jsdX2zEvsUfKSkL5pY3m7Lw0J+nd+SY6bXUcOXTnYg6DsIdU4OJHkW+Wa3j
	 V3sUvK2XG+DOkuBjOmhGlKXGHIZUba/XYJkNjNBshETI9Qs1rMBLgsjmxNKiFD6XDvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076677;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZizpUZVQzhsb5CtBv/UTg8HHKNryTN52kcnOFyzHuG0=;
	b=DtGIveojejnPBhBnvyfYlPUjMM0S7SuGJC1RDlGM+/Blr9NpLfb1UJmYw5NqSnMJoCef
	 FtbVZvl08TnT7UikRH6PxiyUrlUyg+ya1apoBSEReBaAl5DaDJIJkmAgtJZBcf7aiZ6XD
	 hulTR5NfXTHaJa9vTlqiiTNI9V+iag7M1zuCf2A5dx5OQK3ZZJnGZcVWGPkaWJFGMz5b0
	 21420aNuAEiEVhAm5ikjkOadvVkygm14md8zXWbeyq6ElAF3Je/ve7xPIAj8I/DKEfMne
	 p5EiEvVSh86lkwrjtAksbm7Vg8jfxnFdSgQaREQ58LDbXGSUL9aOLniyPpvbXlt0DMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="OC4v/Hmy";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwwKZE9d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4773606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4773606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OC4v/Hmy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FwwKZE9d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6vDmO2935509
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZizpUZVQzhsb5CtBv/UTg8HHKNryTN52kcnOFyzHuG0=; b=OC4v/HmyKSQUQQop
	ubk/w8BDd6LIRUUUnHE3bxpBs/2jebgXtWe4qV+5KyTJ7+ERMzfkYrQ2Lxnq3EVg
	GjqSZW7SR7fKtp2VPaRlJOAg8kB57EVQ2mcLe+fPgRWddI3S9CQUtW1++kkDYloi
	U96lR/TyNNHhpZOb2ROqxfLQpbXk3ErAkYBGzh7TN5YDSMA2vkDlfnMQAidHCENq
	4xLXX+k0fsRe6EXbW38xEJ0L7rNEpa1SYVCUN8GM3B1XlFjxkA7Y9kCY0weN+aYV
	ByjEB0kZfhK/Iw4WorxXXjSR0p844vwcGotufZet5v6jWBkliM6Sh3IP2I2lmg4j
	tuCZIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g9ekca2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:24:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so524845285a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 00:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795076675; x=1795681475; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZizpUZVQzhsb5CtBv/UTg8HHKNryTN52kcnOFyzHuG0=;
        b=FwwKZE9djN87gPmh2lCGysSsnzr4r+qU02qVsA9IM69qYy9FcZREe/HIjrnF3MfhtP
         9CePpij6LzFCchp0CaL3iigw9vjdJ3ch5IgZXzMJ8NPWUYX76uQI+h8QfB2Mf1zy0DGn
         24v/4e3r0xfroQiDMg4OjT+vMs2qbNtjwlvU2KE8AmiXII4LYUy/9TN2n2LD4omKhUpV
         1dKzfUtVxCPh614qIQbpFy2uio0XVx3zdtVaH1GC1NmEqaPxocNN0uXf/JjSe27d3Hw2
         fbRev0i379abO+1H9+Q8jp1zhgHsNbql5JN8E5QBbFpvmp9RndUIcPjnER60tIUIBsgc
         xXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076675; x=1795681475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZizpUZVQzhsb5CtBv/UTg8HHKNryTN52kcnOFyzHuG0=;
        b=CAhnDjweXbaElr2Zz0angi7aznMoHsZN1AMirRCTqC3dYb4nXQzvEJlLWUNtUbgNl2
         3KHvpHs0S8lGqK1dV7moM8SlmzC8HogWiLODB1cS04REmLllCs+lpDfg/AUyq1QD1f/I
         HAGpbA9xEzIge7KgpMMxRr0UaI2CGrfy4aQOk4nN32I3UnJUOiViqUmL3sc5+V1NTpMy
         2NlToiiOS7MBLm4ri2brhZkusDvLnALaR2NrnkmCyWLf6JFP0d39986aZ/q+u7tZYJv0
         vsryFkUGjL0CV8Hvxl8q4AKT0WDDQtNt0srdatYQYBUTt5y9oTgMJJUyESKwzxMVg3t4
         m5qg==
X-Gm-Message-State: APuU4Z8yMXW+0X3GcA8Sw3AJ6FCe1Ojq0sbezOXEmMkN+s373jIIXKbX
	Y2olt7hqraGimcnL5k4AhnkRp2rP529cEnUVpQObkaGiFHI/lbguVau59Btt40eC7s4faPWHm/c
	EU4SFQiZEQR5T6lSZfBdBtczjC3ywhwd4xweTAG/D2tcQfe+laKOcCUELbHAVIKIpfBwT
X-Gm-Gg: AYBFou1a7mhdOm0deulsfySl7Z2mQuzUyBc14sd4JZ3XLOSRRVxi+2M2GVwtx2TTjdH
	nf3Tq5NbbYVbAggu4kxneImkgxbJ+o5wkiyT0KMgVpxgsxxsDult6ag5wu8FohVO+BYQhI63vsb
	SdUC+OOUD7yvdUdv5t2V1SjELW2ixWdjwEInmHoSe6gTJMvxa+GfBXnl1EOUXrwfVV2VeHgibeq
	dao4Afg66vggLlpmAkhQNXduD9K0RsdB3N8UD0V6l47TnmR7QHi65hIoVxfoJGxrGuRkm5wEnYw
	G6loKWiPO+n+0DYn/Ra/LgP2WGv3qGd9q741M09HEH/4F/sg2Em3M3jTvy2yUiHVlK3/9Dl/VmY
	6D0qEObGT1IvBI8yCw6wOcauI1Fb3o9T9gZSUic9RLei7L6N/kYL6RO5FshY1Zh8JCtsKPxEZtt
	UNAMcSXHUO+1T0sJ0kei2xvlXx4+oNwTrkc3G3
X-Received: by 2002:a05:620a:838a:b0:93f:571b:c72c with SMTP id af79cd13be357-949995d3f1cmr927290685a.46.1795076674737;
        Thu, 19 Nov 2026 00:24:34 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:93f:571b:c72c with SMTP id af79cd13be357-949995d3f1cmr927287685a.46.1795076674249;
        Thu, 19 Nov 2026 00:24:34 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b721861sm388465185a.11.2026.11.19.00.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:24:33 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 16:24:03 +0800
Subject: [PATCH v9 01/29] drm/msm/dp: skip sink requests while the mainlink
 clocks are off
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-msm-dp-mst-v9-1-ca61be4edfc3@oss.qualcomm.com>
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
In-Reply-To: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795076662; l=3144;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=2XTNsl8lmVUl+PZmxcq8gZzokrje4+P8fvNMDoxxIAo=;
 b=m8DovmvBxfsp/x5F3vUoLSaBfCNBQ8QCKr+XM1XWqDYYy90o70kCJXWDe25/sicszbL8FwV+2
 Sdmb5IADIXiDnQsUO1dY5FzR0ouQrzO71s02lyoHaIb6R55HbfatwEd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfX+nzQ0Rr3xZgi
 tafBSfuKplUJ740R3GD+TTT6H1fIcTbszwLuoSrHYSRWSKmaAI7vTtwgZdIfFSh6f2SQWLgHPtd
 nRFyY2miUfwJw06MTapvv8svLIwuFWfOBBWgc4D3skc6k4D5i8QlSUNu1iUO8s4nRNJ8J25T1KR
 8WIIOyQgQKx1GBC92zosIntMi/mEBXK5NnS+RWod2C1X3zwby8plaUmiYnkgvCa3IYbld1A61Bj
 W1HEz8pKlmg4OdktxeAF12T4zT9oUwTiDxw1KB4L9H3TAKhWG51Y5B1znBnzSbWQZczBdYwYcl7
 WeAkpHvA1j1CEb+185GUsPiC3vLrzo5tcgeWZF1rbSFlqGYAqgza+2RFNbGRwBfkgw3TiRLKVXg
 R6lQ2smOvEhzQaVRD6/hRnjVU5gniGf7SxVY3pnzkJOnp5GiW2Ldk7tkXuY/K3M8u9XA8HRc6N6
 +ZJv54DiUPk0+NNhXRg==
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6afeb243 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gFHGZmHKE-3D3zYqEJ4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: q4d52oMaR3WhUvANWn7C5OGCXo3dr7Oy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzMyBTYWx0ZWRfXwzyITMx3FNNG
 N5Im37O/Mm5044CT2ZumuD5YlFfFT6bRX5b8gn9moEB6DRkRtCIg3LrCft7L/vaG+zYsddVNO0x
 kAhn0zm3uDSvQbWfBVeDFegj8z9ltPA=
X-Proofpoint-GUID: q4d52oMaR3WhUvANWn7C5OGCXo3dr7Oy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190033

msm_dp_ctrl_handle_sink_request() programs REG_DP_STATE_CTRL from all
three of its branches:

  DP_TEST_LINK_PHY_TEST_PATTERN -> msm_dp_ctrl_process_phy_test_request()
                                   -> msm_dp_ctrl_off_link()
  DP_LINK_STATUS_UPDATED        -> msm_dp_ctrl_link_maintenance()
                                   -> msm_dp_ctrl_push_idle()
  DP_TEST_LINK_TRAINING         -> msm_dp_ctrl_link_maintenance()
                                   -> msm_dp_ctrl_push_idle()

That register lives in the mainlink clock domain, and nothing on the
IRQ_HPD path guarantees those clocks are running. Disabling the
boot-time mode for the first modeset from userspace turns the link
clocks off. The sink answers the link going down with an IRQ_HPD
carrying DP_LINK_STATUS_UPDATED (DPCD 0x204 = 0x80), and handling it
walks straight into a write to an unclocked register block:

  [    4.572532] [drm:msm_dp_ctrl_off_link] disable
  [    4.573756] [drm:msm_dp_ctrl_link_clk_disable] disabled link clocks
  [    4.823194] [drm:msm_dp_link_process_request] sink request=0x80
  [    4.823199] [drm:msm_dp_bridge_hpd_notify] 128

The board hung on 3 of 3 boots with a 5120x2160 SST sink attached over
USB-C. On the hung boot captured with drm.debug=0x100 the printk ring
ends at that last line, the drm_dbg_dp() immediately before
msm_dp_ctrl_handle_sink_request(). In the RAM dumps CPU0 is still
running pmic_glink_altmode_worker, holding the bridge chain mutex taken
by drm_bridge_connector_hpd_notify(), and ctrl->link_clks_on is false.

Bail out when the mainlink clocks are off. All three branches need them
running to do anything useful, so gating the function entry costs
nothing: the first one resets the controller, which its own comment
notes "will need DP link related clocks to be running", and the other
two retrain the link.

Everything else reachable from the IRQ_HPD path - the MST ESI handling,
msm_dp_display_process_hpd_high() and the video pattern test response -
only talks to the sink over AUX and keeps working as before.

Reported-by: Joonhoe Kim <26rote@gmail.com>
Closes: https://lore.kernel.org/all/20261108011501.4466-1-26rote@gmail.com/
Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Cc: stable@vger.kernel.org
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index abd3dcdad03c..32d4d5743eb3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2321,6 +2321,12 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
 	}
 
 	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (!ctrl->link_clks_on) {
+		drm_dbg_dp(ctrl->drm_dev, "link clocks off, skipping sink request\n");
+		return;
+	}
+
 	sink_request = ctrl->link->sink_request;
 
 	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {

-- 
2.43.0

