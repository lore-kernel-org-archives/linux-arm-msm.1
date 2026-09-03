Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D658E48F85F
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788432461; cv=none; b=j5MKtXNFaZbXL+FmMuQTR63tsvkFrEafRGDtBsJ908wQIl1Cf15SiaWqh0O9BvfgvV5V11Vdi8pSyEDrUUHTbsnhKmwvFlGrgx5LX9UU5dTsvTgwbnqLD4GqpD5MBTriZhwpdgIJgX77eglyd1Q9i27NjglzlD6zf64tk+vtTBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788432461; c=relaxed/simple;
	bh=V8nM5ZVDBd1LAKUMw2qo2H8ikwSqlwSyX28b+z3cMbo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sQc4/EfNwlDreYUXV3pIVjDd5mhNNbdDsBLP1Yyp3J8Q9W2oUQyKhCQwz5KJjQXSS8cgTXjZ/aBqRk/I0n4+CR2jPrEun1SAM5xsW/OLkcNwPtNjDeoCD38qWEonC1yR2UN1TBPYF8APAMIBRFzSdlt1W9xkSIfSkDTPqcZxCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ei9Qz8a8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CGVXPrbN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ei9Qz8a8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CGVXPrbN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHdmw056065
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 10:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQtHBeLkyoxvrSXVHQiYbnJuaYly5Ui1KhY
	xJIjeP/M=; b=Ei9Qz8a8hR0/5wjpLGkvlAv2zCCzYmtiYE819EX381QpgaCF/YV
	mJGe7K+GHNOmzeC9efDyoUBdv4w2/u9Y+YIgz4V2XRHRgj64MXk1ixZgJrukHfED
	6UEdKZ7WDwUWxwRvMhjU3NaDrKnA9cedsQ5DPWnemEKAWjgbI1rZO9fLukdDKHdE
	SCjiQ86c4v3QOPPucyYg0hfaiS6j9zMjBSbE1YmLJV58gbJtSwpqmLMbLR00aAxp
	TQCSKVmvVufGXui9sw5f2LCXh4l5ui+7p2dtpv0WQmeIs1ZZ0/OWlJAxMoYT1otA
	iBPCSLIHNYa+mq5hSyXKeILp61dG1FOmWlw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvhd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 10:47:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so405367285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 03:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432458; x=1789037258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQtHBeLkyoxvrSXVHQiYbnJuaYly5Ui1KhYxJIjeP/M=;
        b=CGVXPrbNqQ9cpuOPykLCetMgse5dgx3cJDH0/eX/0X50DhppoD6ahAZYeV32Fl1noW
         DQfxOvxoNg7f5tRNfC4a+uCAwznNLG7Nzv17H3MblezoiC516bz+/GLrEx+Kl5Va5oCM
         9W8jNpzR2lSSsre5hwJd59+2sblVtQyte9n/c+So62Hr+xk1yMYZa43t4FMbCgT1ydy1
         /EatruRHXza33RjwI/NNiywANqh1wr8IPrsPIDCR99jDvGyDk3l+5o+O5SSGWDykDBEa
         uYdx+L8NAXrbpgPTAtKQ6xWzuJc72W8j0P8DI2GJXFRJCQNsJO7O2wJ/sZarHg9dkIHP
         LgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432458; x=1789037258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQtHBeLkyoxvrSXVHQiYbnJuaYly5Ui1KhYxJIjeP/M=;
        b=YNLSMHLN1xHf7fMXnayapi0UhEb1X7CFm1LnZJwAQTEtcxmWBRGiEWfkw7RxGqHvjM
         ARRrXgGAjQfMTcPcDHDaKjPEQLTy/lsL+vdVILolqt/2HgrxBPtXo70uldfwraJayT4u
         woCYDdFk2E3ZO+T7ik8e1ep5JdM9+6L2aRvxBn4jLXbiDK2nSKNgV1j6kQR0oLnbYsN7
         nStONiBW+FprpndrcvamzznhqwvutepGwmosTyGkA9LcB2ExOEt9EfhN4c1QrstMn/Dl
         tGckg6OLh9Dum6hjHFsddrl/uz4vWoqYtPmnWM53qC+ZU1jZsN+9Vgr9BfU4pSBhxpOc
         7OZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwUq6+7Ka1F5Pfbqn6aAj7IBHLIpImdu0tfeDNVHiIA+athpqJuooajE2aU/MXgiGEcaLyAPT16XhVfqsaW@vger.kernel.org
X-Gm-Message-State: AFuF++mmuLR9cjrJEX9UzCJeX5f0ZQ5ZdQMj9SUyMbGBEqnWjA7pIB0k
	hdWL582Bl2QmqKz7bulI0F3qIvEY1fUUh7zAsFi+NliA+VMlX1iEpWKAKOev22GTZsZzrFbjE7X
	iUHeIFiqRpsga0AW9ymDZD65Pr7iLLYUy1seq8/pvyc7urSxycpZ6n1Wu3sikzryth5h2
X-Gm-Gg: AYBFou0DYyvzCSX13mD14hYozD62m3r8komPL2tIV0ng7QQfPYKh2iEr0go3kbSAX4W
	lZ2BQishwxXnJdUW1vofJzT40MeO2W2ITg8ioHI1h66LqiAfMgUS+EVFYS1OvtwTeQvtdUUYLhW
	LFPbRMsYeed3dOeEMmOJd1Tsmt6/PeV9H+sLWzad+WIW200ry8q76mNtDlZAD/aaOfA/A9s6wNT
	fDYmZExsBcaS8lizh1LnYqfHvkrZtRDP8AwR387kNjJrevIOrSvMXPOFugZelyxYICU+h+RlrTE
	OwQ8wKpb9S2eZONP55747T/TjQ77QQ25fO06aYX88hQSv83I/x7Xx0bNTgoK8ldWnrr6k2Us+N2
	ndqZ/zjpFWJXwzA8=
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr305155985a.13.1788432458052;
        Thu, 03 Sep 2026 03:47:38 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:939:191c:cac7 with SMTP id af79cd13be357-93972cbb0c3mr305151685a.13.1788432457566;
        Thu, 03 Sep 2026 03:47:37 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce58da3acsm243012815e9.0.2026.09.03.03.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:47:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kavan Smith <kavansmith82@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] drm/msm/dsi: Fix setting completely bogus rate for byte clock
Date: Thu,  3 Sep 2026 12:47:33 +0200
Message-ID: <20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1992; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=V8nM5ZVDBd1LAKUMw2qo2H8ikwSqlwSyX28b+z3cMbo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqmVBEB9CRsNn5ZoN2a/U571RFRfYoRRPhkrytn
 MYkNHfSz5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaplQRAAKCRDBN2bmhouD
 18nLD/95pY1jOWlax5aOMbTncqcjSt3c+6iAQMgw7HZmWnb3s4P4f5fVm5RqCEYnkfO7OHc0gkd
 vc1apdMhVa+rwHNleX88QfYjafyEJldnX9Z31SkAQsA4OLVKfcpJg6gqoplEp7PE4xpJrsVFR90
 f3f1Gx5YRxqLRfJ7+pYeat+bFNKmB0PH2jJ+OmAyE8nBZn6IOT15rLYy3To5DrjRm6VrfguYz+K
 CoGC/6Tf4zMPl6dc9/98ZdQoHfEcpBKtn9KxtVIuDGuQxyjM8w9jNcqhw/gISQnMQMBdela10WO
 b/JRqA/fPltdR7Od7B5FOa/2THAmK2LlCYc6C/3nzBh4tNBorqSBk2Y0XakyAUn1YIN3IxL/j6D
 SnqRW+HUefk+BD4FtgWO+Eu0b6fBXg7lOyYyXp1efsBYddbfsuaRInbcoLlHKsuIMiOMKTQjnf+
 Yuprc4TlQhobfOc/IIoE0XNce78Wjl3YK2CkbWW9yvKpGM2V8+Pbsn1pBZ0aiygop9ySukhyiyf
 8nYjJcA8eoJ+XF+Puhz+ptQAZLgcET4R8YhT93IZ6cY2oS988QigTenlD22VX8wCulx/Z550I3K
 qvVvvJwCbOsTAzYo9rp0KEIgOFTLWP4nRSytTX9e83Ldq5S7Da02VyeYWONCzQyTXmnGn3kORCp v1UO/w3/HgkEfhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a99504a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=sHYYe3itZNe9dr0yhQMA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 4-Wu7tu_fyRnnAkmE5PgDa1Ja_RIMk8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX2ZiPOfswETcM
 MZymGpLhOsWTKCyXngOaA/6XsvjrunPRJXClJhDVb0uXqDH6BYmsUSL/K9MsYBmN7vOADSScsTG
 RWuzENyyU5ywf6NgYMjS8zgiL8QV/rUBhkFOaKlHHo4JxCg3L3cIHY6vDL6tT5XvpxRjYhbCwGZ
 6xrslFieT4OEZh9TvyKK26lkOUfZyu53yy6cgDiPufbXQgjIJs1EPMM1ivDSMa5qOWkyWF+Os4U
 fCEYjK/g0anA00OP/WXu2Qhm5RzuEnILCwhtHGNivjqocq0cwadd7YQTYVepFHGPtVUPUIzb97D
 HuyH0hNIIgB8fktGSBackE4ipemGpx70l8sX11c9jVgz+b/3lN7xGPlZQ2FjFLViLx7KfzCajde
 mHpNHTNHud9skC9oIKdY0TnpFCFtsUIseizo2pEVMHNGKnNMwiZb7C5cfSky2qv+xyf3/gGp5Cy
 6KEH+SLEUH0fW4HOvgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MyBTYWx0ZWRfX8J+iMmXLu6cj
 ngACYHJ4sfM7os5eRvQ/v72c44xT5tHzvIeGBr643iCnYnt73xk7InbyusNFUISgwSr06ZVp3ij
 6hqPFa2BNb+cCvGRhuzq5lTga5bmEB4=
X-Proofpoint-ORIG-GUID: 4-Wu7tu_fyRnnAkmE5PgDa1Ja_RIMk8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030093

Revert commit 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to
the PLL-achievable value") because it is absolutely untested on newer
hardware and obviously wrong: it rounds the byte clock when the byte
clock is not parented properly, so the rounded rate (used later to
actually set byte clock rate) is 19.2 MHz.

This broke DSI display on Eliza and probably SM8750, Kaanapali and many
other new devices:

[    3.164727] dsi_link_clk_set_rate_6g: Failed to set rate pixel clk, -22
[    3.164729] msm_dsi_host_power_on: failed to enable link clocks. ret=-22
[    3.164733] dsi_mgr_bridge_power_on: power on host 0 failed, -22
[    3.164760] msm_dsi ae94000.dsi: Power on failed: -22

Fixes: 6cd33b6f4155 ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")
Cc: stable@vger.kernel.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 7e4e3718b536..78e6436a92b2 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -669,24 +669,12 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 {
-	long rounded_byte_clk_rate;
-
 	if (!msm_host->mode) {
 		pr_err("%s: mode not set\n", __func__);
 		return -EINVAL;
 	}
 
 	dsi_calc_pclk(msm_host, is_bonded_dsi);
-
-	rounded_byte_clk_rate = clk_round_rate(msm_host->byte_clk,
-					       msm_host->byte_clk_rate);
-	if (rounded_byte_clk_rate < 0) {
-		pr_err("%s: failed to round byte clock rate, %ld\n",
-		       __func__, rounded_byte_clk_rate);
-		return rounded_byte_clk_rate;
-	}
-
-	msm_host->byte_clk_rate = rounded_byte_clk_rate;
 	msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
 	return 0;
 }
-- 
2.53.0

