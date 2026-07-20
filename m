Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638B3AB476
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784527896; cv=none; b=cjV1FD4KCd0mctXtD3hu/z0aXloZ1fv9RRQKLW1fmMoSSzT4Idnq4Ri1CCVDp1H3Rd+bCuQLk09HKmDw+vN7P99mh63leLkl3NP1aoGoSBKvV/Pl03L2gsDkKIAsl23dyaEpLWS/ZA4lMVUWh329zJP5H76NbpREhMyHP7rkBlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784527896; c=relaxed/simple;
	bh=u42nKidDiGf3s4uqGsqfLPYmVyOqtiq6FmPfz83VIe0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qg5xtt4Sglv9fW1Gud0z3yCP4lx2ijPIAJwlv4dwZv16B80NwjfNfGK0o6xeC7bZ+GyQrw+W4IcqJfVQCy4pt2zuSKVMU1Epz55NArYXb5RNX5FMdDTI5bcSCh0KkyvDew2plQqMY1lj5lTo0noleY9OsQgJ7Y6HRVOzIjXyvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ky9TbRx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Shktv5J5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ky9TbRx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Shktv5J5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JNvNSi649802
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEWZpd5Gqhtf8XBYTYHEDseLEqITUq5QSnbj3RUGq/w=; b=Ky9TbRx8knauOddX
	Pk7hl3W85uFyBtKMCwfWklxUngDv5r9eH5guLeJ/IRNYtGg5AGYvFqelijs+VhMb
	9nh5NNyYzKZDF6ccFS58Tb9ZtPuZIjugOUL3uO2uHUViHJpIh+5GZAXx6EtoyBRb
	Uw5y80Fkszmu5j1skXbY11E1tXYBTAT+U+UNIG7avYrO7bfA8sjh41PfNPGOunGs
	H0JtVYz/kyCkme29aAATmpxDUO4q2Zo3ZwfiQHjJ+kcFshA514/664ndyqI31iGe
	PsK3fcwBf0KEz2HCsUVLKswTNcChdmTQOvqFDA9ys9B1J++E4rDPXpllz5TXntan
	gOdQ9A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvvn1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 06:11:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8fc92c5373bso182759676d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 23:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784527880; x=1785132680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEWZpd5Gqhtf8XBYTYHEDseLEqITUq5QSnbj3RUGq/w=;
        b=Shktv5J5xXNGB4G7CMD5alnzeeZXLGo0dn+kptqot2W2+RqBIlnfPTB7YMwkNloJOO
         SUnEabfKWePpJdGypggX7jWOVr+N4oOON2sAUCjqkSHoaAaQIFMQf23OsUtkLmsBf7Vx
         LssO8+VbHjw72mpOgs1Hr2CuVmvILEztD20YN+dTs89e81gqVjRoOFd0OvS5vPEnk/vH
         hrRHBl0ucT+BrFTv5FEDzw7V76FLp1SwDNMlOdAAg6gPwapUWnXkMgFWloIpDzTmuHEU
         4t376dacQAwBG6Nu5hydvl+ulPR2r0SXvqrQ5EoJ0QNOWcM5ka1PzS3G19qX9InSytmG
         q7dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784527880; x=1785132680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEWZpd5Gqhtf8XBYTYHEDseLEqITUq5QSnbj3RUGq/w=;
        b=gka0N170y8ZhUyksAYvoW3T7VFeVsuehnLDiywr0ab0fagXRz9GexpADUx+O5b6TIu
         KqXPPxhm49kuaq5OcZZVjP744PuefHN1FFVR+e7VSHVZ4Fr6LS5/1LY99Uf8E7xoxjFz
         m0KEkwbe+3a2e833kPG+yb9vNBrEDgVCNPV55aOZN2Y3FP6TDFdpD+CNFtpI9VWDhmon
         ojhDKJrb+FUGFiCEtFezz0L+ryP81qteGQvJDKhWfSlUyI0KEiws6p2Cgb5o3c/Jway+
         KwWaCTZTMAAoo/ygNF5l9gHMeOiCmWsX/eQYX6GDPmCr1ea5PTipAXsnxA/cGIdVGsr5
         Jr6A==
X-Gm-Message-State: AOJu0Yw4NN6XAlT5KTpi2Fp/1IMps4X30D2X/r6KI8ENY6MvLt6Zki4l
	aSC/cDcPe6rVurBt9LzrNxRvffWnIcTfqwq/hMxI+wtF1udlxODzdDG1WXRtocsiTmedFVowW5R
	eV+Aq0PGJX5kvVHTSkKhnSlTwYqEjFpUHrX9lXYvxT2cJ0t6245Rjqo72VPyedEwt53xW
X-Gm-Gg: AfdE7ckLnT7N/HbtOm8HJ+sjf5ycTvcQ2mQwhEHHE/eD4lUrraXs/HQ4nOh3tNeDwcK
	al3wMhzKovI0KftWMqSj5Euy7H/cix5nYKhL07O9cjeinq2RYI4EGteceeVYZ6bbvX+znh6SENV
	suSSVszx2dJFl9YPS2Zae2PJaysQH0ycAtvxL4WISeqtPnAa5l3w/FpCwKPYgRhcxHEl15JDkLK
	LYIAgQc8GAEIT/RvQFRNmzeBih/9hoeBdMm5TLirrQ+FuvuGlA5PPHDwN0OmoTPFlDmIpMbAty+
	UYwaB10FRv5U3D0nsg3KyJE8uRR8udPMDgC56dAvkFpKWpWlLxAHa0qJlQrP40MP1NXe75sBwDO
	XUxdZhHjbPeEErV7kSPzXyqJS+21dvwleZNedylkCAdwTthlXZwyJRu8TWhfm2J8=
X-Received: by 2002:ad4:5f06:0:b0:8ea:658b:aff9 with SMTP id 6a1803df08f44-9077852a123mr127422016d6.50.1784527879853;
        Sun, 19 Jul 2026 23:11:19 -0700 (PDT)
X-Received: by 2002:ad4:5f06:0:b0:8ea:658b:aff9 with SMTP id 6a1803df08f44-9077852a123mr127421816d6.50.1784527879383;
        Sun, 19 Jul 2026 23:11:19 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778588a39sm84793216d6.20.2026.07.19.23.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 23:11:19 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 14:08:14 +0800
Subject: [PATCH v8 07/15] drm/msm/dp: move the pixel clock control to its
 own API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-dp_mstclean-v8-7-bea261bf4e7d@oss.qualcomm.com>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
In-Reply-To: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784527840; l=4071;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=u42nKidDiGf3s4uqGsqfLPYmVyOqtiq6FmPfz83VIe0=;
 b=yxSxLVwOK6nvrS5n2lp55EMGW4AYExevs0LChoKa0lxxQOChL76cEzV+X5VeX11o+v2IFzJ9Q
 SgbtxVlUmJaBfOqlE7QT6IpVtYGWDAWh2ye1xW4fszxkQHeCnmgC+z/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: smY4kYHdNtrmS7ZT4mFKS6jH2kxrmYM2
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dbc08 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=FjMX0bmgnFGAle5WrLgA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfX/9m7PMOYyA90
 N9dp25StrzpAodIvokIlt36ktuLX01woXDd3JLI3Xe7ByvGoXrt9G02IWhtgzfx+PnoGfYfIKvh
 mx2YMqPkDNeP8dZ/DOzi1fZ38ieWOJB9NJAM3Stzzb5AKITiCkS8WNLJNrPbNHQTRE+IK+ZO3Ng
 HVqyPTVKcw1ueLmUt+dECeY9BjNtT57dDF0wT/z/7Y5m99dMyQdiTf/senhHa4zsz1M21A85HAz
 JyPt0Kij64XriRcmPqHLUQPDYBqt69hw6QsM8cujb4/IfAV9aksZG+CbJxV3vZwrvusjRT5itNA
 Fpjul/HZAKqhjlvk+Gm6UdodZUIxYGwbkOclTtsuOqwtMqorgFeBEOl65EqMQB0fIf5mooZMm51
 g0Odv4A//pOE4Gd7MRaNuXS2yDB78DSJ4bYI0Y9lT0DKQQI/va2O09a6PBOKgO/3PAXKrMRW6q1
 xlTbtwaVF88X/5ZjFQw==
X-Proofpoint-ORIG-GUID: smY4kYHdNtrmS7ZT4mFKS6jH2kxrmYM2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA2NyBTYWx0ZWRfXylXLPeypi2Jj
 wC60HRnZ3nmkI/lCKEa9rx9OsWeqLN5NNGz7UWAJ8A5WjGBVARwh2u0oRMUTgH+3fuh8Y6DIlqN
 mx/yOSbs/XxOhWdYduTgxRQC/2k7/Sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_08,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200067

Enable/Disable of DP pixel clock happens in multiple code paths
leading to code duplication. Move it into individual helpers so that
the helpers can be called wherever necessary.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 80 +++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 711579de899d..a79d9bb93cd0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2172,6 +2172,41 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
 	return success;
 }
 
+static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
+{
+	int ret;
+
+	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
+	if (ret) {
+		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+		return ret;
+	}
+
+	if (WARN_ON_ONCE(ctrl->stream_clks_on))
+		return 0;
+
+	ret = clk_prepare_enable(ctrl->pixel_clk);
+	if (ret) {
+		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
+		return ret;
+	}
+	ctrl->stream_clks_on = true;
+
+	return ret;
+}
+
+static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
+{
+	struct msm_dp_ctrl_private *ctrl;
+
+	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
+
+	if (ctrl->stream_clks_on) {
+		clk_disable_unprepare(ctrl->pixel_clk);
+		ctrl->stream_clks_on = false;
+	}
+}
+
 static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl)
 {
 	int ret;
@@ -2197,22 +2232,9 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
 	}
 
 	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
 		return ret;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			return ret;
-		}
-		ctrl->stream_clks_on = true;
-	}
 
 	msm_dp_ctrl_send_phy_test_pattern(ctrl);
 
@@ -2515,26 +2537,13 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		ret = msm_dp_ctrl_enable_mainlink_clocks(ctrl);
 		if (ret) {
 			DRM_ERROR("Failed to start link clocks. ret=%d\n", ret);
-			goto end;
+			return ret;
 		}
 	}
 
-	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
-	if (ret) {
-		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
-		goto end;
-	}
-
-	if (ctrl->stream_clks_on) {
-		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
-	} else {
-		ret = clk_prepare_enable(ctrl->pixel_clk);
-		if (ret) {
-			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
-			goto end;
-		}
-		ctrl->stream_clks_on = true;
-	}
+	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
+	if (ret)
+		return ret;
 
 	if (force_link_train || !msm_dp_ctrl_channel_eq_ok(ctrl))
 		msm_dp_ctrl_link_retrain(ctrl);
@@ -2573,7 +2582,6 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 	drm_dbg_dp(ctrl->drm_dev,
 		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
 
-end:
 	return ret;
 }
 
@@ -2621,11 +2629,7 @@ void msm_dp_ctrl_off(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
-	if (ctrl->stream_clks_on) {
-		clk_disable_unprepare(ctrl->pixel_clk);
-		ctrl->stream_clks_on = false;
-	}
-
+	msm_dp_ctrl_off_pixel_clk(msm_dp_ctrl);
 	dev_pm_opp_set_rate(ctrl->dev, 0);
 	msm_dp_ctrl_link_clk_disable(&ctrl->msm_dp_ctrl);
 

-- 
2.43.0

