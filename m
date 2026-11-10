Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794286484;
	b=LLBuj4jK/fK5T/5a2Nf5JHsvls0VYDCVUmz9PZmtnyF/2QrmAkXkzHg0fV5pZJPlybwj
	 Q1M2uMYHf9Xu2JvzK+Qw0/ZrH15o6jsq4OnWZmPp4uPKONGyUAjbmPI6QhfKQyUii9VxB
	 O3BK2/ZLBL7+u3ms2H/UNIm2jbr3jGNd3vo5bKuiREdZSsE0p2f99A09F5AImBsxFvCeo
	 OkdFaLXn7XQFrRQLZzzNWLuO4ltgR4jpceIPNp1oKKPKhiUc4nthgJLQNeSiteWnSxGx1
	 TU4LZEqm0xa0boPnvbRJ8yOE7dlEryru46mYBg4tdhYnvzH6x+cFgkcuiUcbbRQl3Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794286484;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
	b=bInCZdWpoqFvqUsbjfNajlPftAr5MkC0ReGLH2xYBYs9l36mrsGYMM0VHEFWY4GoW52E
	 Y65cJJOaKjfiDaDvaNq5b7pqD89sQ8zfxNXiIMhbRvW3VpQHe0wZIoyLcDceuonqh6jYW
	 D0VXP1n7EJBCFIROHgjbP0i4p7NpQCRw/SxVue+tdz2rW56+LWnktg+9Ez4waXD9gIoCp
	 SuTHIG7RRpXWVhpF6DB2IyX+9MlFgErVrS2P/8aND43UZBImz1zCuUqdejJY+VRXp647K
	 zrhtjmtSE+rstiivbGbk/fLQO1mKS860vo1fbbilPT/XtLB/NrQkpHF6iNjh6TnbC3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoEFLwST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl2mBaEm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882B4606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 882B4606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FoEFLwST;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kl2mBaEm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA4A6eC2275508
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=; b=FoEFLwSTGj54VfGz
	xJMwMhTumAgiVj2HcJJRXvLB8+sFSIiMsy0B2ovn/WTPBVO1l6YetS46Z2GFCb5J
	XRHQ8AEB472rB7LbMQRhifMVnoQtAK6JcRYAm05bduusR17p41gWEPP1EUcFeSk+
	PHYpHqW1xyXH6caV+5jlwFqDFlcbDhyO+lGqDYJUIJZLNeIWIPnZpn8wxFlPrAQy
	U2leU5R2K7QfVPtAq7xr9a6tZYP3hjVNEX4x7dXuDG8NP/glZYG6Z50RybskPjBh
	aNb5qA9KKZIxMBQMBqP5sDFWTVX0YJmgWfcuPFM0QcUSjTWoyYzh7l3ztmuVDLKv
	JxDCqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf5bgu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 04:54:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso425741085a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 20:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794286482; x=1794891282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
        b=Kl2mBaEm5NL7sNTpEe0uDw2tgIhmq8rD9DynCgSmrYx5qOAjefwjSjcTBFl9A1tJwd
         Owe8Ub+B//GAH2wHbib5/nDKhlp6IHaUD7yHpEDSaXag+8vBi2H7axC9EM6TT8IT9cF6
         5d25y96l5MRhwA9BFUoeD79YtpcEeStzGCY1sNfAb3E4vvK3bbo9yHsZoPTJ2U30nx/G
         htYDfYo+jg8JpM8l0yp1Vmb1EiqWoRRu9QiN5tmk4EJnWHg8To02qQtTXVEOefA2/B+m
         1D0Eyh+RFOrEf4LBrWer6VNTy0Wk59W4R1/m6/03qZ2jZhXhhhAHIpZa4IiKBak+W58A
         TQkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794286482; x=1794891282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0APUxkvTPgI0ANhjuYFxN+VuatDRUzGZ3XDlAXWiZE=;
        b=lFX+hyv4WO+Ks+PXcChaCtppc5zLzBW1QBX6uk6sfg5cGqtbFq3SiwXsi5OA+I2TSg
         ydc4LtQ/oIy9Olc5mRetgEZwWFhKuIgjTKOE3b+Ck9Xp2i8jGVnynmHSENF3Ye9lW4hJ
         s0CvR7S9wQTstKQZQcGK46KJc1G91PmOqgINKjxcbh2g1w9VDvM1sRW8PrxNER78K+SN
         H2i9nMvEOZxqCMkNS9FLvK4XGfHJAlLZlH74tC73GAD++iWUzy1eZzEDDE7SY7+yVoVd
         QbpJZWo1g2S4DkF8H9O3xBs4FWpEMlAYh9KXNl6SzVvHvNasu2txtAXHXrlYkGPuhOk7
         3XGQ==
X-Gm-Message-State: APuU4Z+PFz9shjIpBHf7Q/+W3LCVVHOIIqcXh0LdDXNX7sbSkC3ehB0D
	3CbGc+L7gxXwyWDj6AZLv2Ur51j2V+FcYE6aeKTOPqCHTUC/ETxsaEWKrVVJhqby9Dztr4CneS9
	smFmzo7BRvCxKPHJfytVZbl7sAGaBQRM56YbrFiLMtbdmG3MSQbAmkGUHrXCzIYqavFaw
X-Gm-Gg: AYBFou0NNTdbfIV6Hf6dDbKQyIJMELlV9XKcCSpkUxS5O2NO/CHV9pOs97PCnkwoHPr
	rBHu4rIn6as3bFLtJ09u4Y9T+zec021LQsvMiY31u3+beBRBIpzP2R+uxnlyrDxr0mQHqKVvn2v
	tbHDfaRuN34xhBN/BTzfKTpcIP5+RZs7Ah+XdScyCWYO7pOMtXII1ghPuZa3tcqxRaxgcd2z4Ld
	G2A2elaQeYnqyPBn9NOQ/W31K0ljRADFaXeAc1wjEnIL7i/xDKK8i7Fivt+OsThmcQQuoqoL8Be
	DC78dz6fkBQooA1lmOtckFMQMofrUeqQqWK+dIdKW9AQrAzL/KkAFKzVhcY5mYhQySwPjqzjeVh
	Qb7Kr9RAGBmU2f2d66otCeTZJ+3WUKoicYQ7ARRDwr396Vh2vAz5crVGjeyiCbbb1pXVGu9UD/2
	BDBNTLL7Iv+d9WFf+u8ZSYs+Wf9a8nHVqmQyAt
X-Received: by 2002:a05:620a:4005:b0:93c:2c0e:7ac with SMTP id af79cd13be357-9479f31225amr241386485a.53.1794286481749;
        Mon, 09 Nov 2026 20:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:4005:b0:93c:2c0e:7ac with SMTP id af79cd13be357-9479f31225amr241384485a.53.1794286481200;
        Mon, 09 Nov 2026 20:54:41 -0800 (PST)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9479e73b2d2sm138653985a.10.2026.11.09.20.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:54:40 -0800 (PST)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:54:22 +0800
Subject: [PATCH v8 01/29] drm/msm/dp: skip sink requests while the mainlink
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
Message-Id: <20261110-msm-dp-mst-v8-1-d040fb33db5f@oss.qualcomm.com>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
In-Reply-To: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Joonhoe Kim <26rote@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794286469; l=3077;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=hT9291PUkSkajfmAeKZ+I+nNpFsKsuD4le8SAcshPD8=;
 b=DRb/t45pYDIi5C9EkFbmqMtY2Eu8B3Rc/4wjmSbEHORPyc3xoudi1H3qM3F8wKSVKjqBpvg6+
 F1ohlqUSHVPBdTlPy9dSCviDLeH9Go26kJsvQkKKEa3Nuhdr5TwbavG
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: QL4b7_zJv_5y6Ul2vMzfjesbzK8CM2KA
X-Proofpoint-GUID: QL4b7_zJv_5y6Ul2vMzfjesbzK8CM2KA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfXz1pDVH/j23Cz
 5ACYz3ADA+uoZ+q6A/ZTFKaHhp8n8n9lqJJWn2O02ImxUzdHW1QD5+NMU19RkadTQ7BLvWq8bAc
 chomlwnEXkgcuqk16/BFqVjwQJ0tauE=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af2a392 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=gFHGZmHKE-3D3zYqEJ4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxOSBTYWx0ZWRfX/IEdHYq2bd0/
 dzdXR4liJdsuesiXtOnoiErh1MBu2sH2N+vPYpQCFFFkZMpa8acwM4CGBmy7++rW2Oa6zPWDdUC
 BTRA+062LXlhiDM6iI5l+GKZXzJQJHF+OSsJZbfR5g9rJ165ErKVjLcwUoytaROnXlJHlWQAPy2
 cHMDYE1YV7JhlIS86mzQ3NPqCSjlPuEHRhvXuGUvUKlEK12Bf7LttAaMQccK9QRllH8VIqqvhnG
 0aLJE8W8tt5FD2Hc4v8o1DgBfSI9/HQX7vrDkGxQhPOLfpbr7K9TWxOW+wZCzeDy+B5u6/LEACO
 ZwLdHkS9XEBbTwx8EuV/VIrq3WXQcq9WUbAkk+1rP/Z7Onm3T2Ad+LNR/lG4H/Kvz+CRLi0f42G
 XmGKoNQBrYXcrhYGFe2rDM/qfoeHe1T0EXMxYPy7/GrWKzlCoWZLm12TBQ0KzvVwCu8nA2gjD7X
 Fsuih5z1FGnyYEcH3aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100019

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

