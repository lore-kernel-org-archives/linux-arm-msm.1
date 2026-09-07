Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BCD4DC550
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786060; cv=none; b=f74PJSGQYTZXC/3df3U+FDVxtFlXbvyE8fXjELVeQyPoWqhgb1Ca0pmNqogBYcHlyajpH3B/S88BVCZk87shY54yr5lQvv/uiO2RVx2GEVM6wYLO5R8vrSQEYcBBGanbDs6IaC+YdXlVtKCpPOeZnvrwqHDDeH84xph0gd203v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786060; c=relaxed/simple;
	bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2/UKnm7ZMc6c63YeMAm2NIuQdgmtAE/jaKtKGN2v0qzBUU9Xdh4NdgvztL2olc9CBTC9j2Q4bVst1gz+EbFNJljLyYTUKGR/XwuHuTdU6cRChrFTVxNduQxzeReSCSEIc/QUkpgeRrunYPY5vKNs5s55DzMQupQpTmGkoYkkJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U0QyZFyb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xabq7Gu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U0QyZFyb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xabq7Gu/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amt2x2652267
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=; b=U0QyZFyb5KLlWYk8
	y8Ms9NBX7C+Phqwu8Ja23/VESvpzoMvk/JXsL3Oi8uNXNanZvrQBAURcGEln0dhU
	imAGiOxBvNb/EkQcgf5b+PafT+OV/fS4GjbzG0IU4k68ReQbByXmawJTIJrLP1z4
	op2+k7il8TCk4R7rQsUOd9W6EgH7GgtVk5DVcWIDMMBKBcxRjvtBXnlAOII/nzX9
	vaB3S3hSlWAYT+jCsuGDzB8cX6OKU+P+yR/5pv8Vz7yDHbx1Gr95znCsuiphDKEY
	8rW0xgGTs0K29ojscyIzxbq80hyJH701/z3VFhjolYhfdTSXUaEBdu/EStDorqvF
	/xHrNA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0qge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:00:47 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-785827e6073so398767137.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786047; x=1789390847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=Xabq7Gu/Tsg9c6CEsjt77iLNyjzW8YFHI3Q9oBLeTAc23mxZnxMLbkdJnbuY2/dXuz
         Z7/hKlR+vldvMdHq4zNY+NXuggozVArqLu2KVZKMEho8Q9Qh5Qol509nfFmDRmbR2A8U
         n8tw1LnKl+pWCec7tWc3TS9N1LPvjWV5m97489vq5Qpp/jVcXAG3fMEVB5WbgVEoOjxl
         bitcvTaZAjrqSPt/wwYeWjeFYb4dWNityHyjwby7Ze5JmWiictbMD7A9QLiqj+P31bN2
         Ea0WoVS/w4sPphH44AS1R+cUn3dYdq9pYkx5C4mojeVs9pEXIjrZw3MWZy5dNjcNuPoD
         R9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786047; x=1789390847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=HalyfehdeJcUHlo0OJ9t3jD+lSY5BjqywR515jWeYli157/YplaJfOm+uvZu7iquUu
         oiQQGDP9XYeIy64JlR3MGd0+gxjGfVWox7mLJScQ0lfeao/JUgVO6sUmVVveUftZHHBf
         I+p9i0u4+GstEEmsL2FztFGc1zpDyAHUeYQWjnX/AC3whtfTD3o6Xc/OKM2/hq3fu6a3
         pVTFKYXUkYIsWHKb9taUHlGpetJoVP4ZcwwzJvesnlckbyiHIdLe/JGeE+ndekKARuV4
         8YIuLSb3Di+LM6gmE+UFs+aIBIVunrnV1ukhR2oP6/dGc+kP2QsFf+G0crc7AECvgBZb
         Gzdg==
X-Gm-Message-State: AFuF++k8HKPDLPL8v8rIYEduxG1ffW60iJUIEJTj2XPDBFq4aUGzDFn6
	esTMDNmfnBa4WiUPN6/p5GZh+tSusvnssQh4UxboCXdykYPESA9dtLC3F+pN44jcS67huG0RqZ8
	AMJ96KPdMfgkSAROfKGX2qunWyZyrzhJ+XpRcV3a+1qPJwMV2gn777HifpCgDbmThRFT2
X-Gm-Gg: AYBFou1AuP+efUJpV38VblF0J9zdqoMHKtuOBAc1f6tgW0e8luui0fqliTMUJbdxRQt
	Vf2JUgt2QbAcBay32IaMWdWZOGA+43FgftX2l4j0KbkB4hbP0Pdy+qAnzAbh50HSRzPinbb4NUH
	hZ5PVnWW1fK47RbzXKGnPmGgZEdxxYHwnmENE4941RaXUoVZEQj5Hv4vb+4Ifl7qazW3lYKCjFt
	YebJR02toyuyz+ArtRwZppV5f9xlO/t9sprjxsDBdw5HDwhcLNlKX1xsSnvCTabDK6+TqlB/P32
	2T7GW4vYsbn2Q8oIsnxspRWDh54rdvA73UdHiVwC+XyQZqXI9BpCK+YDVfSYkw8ZJpbr61lsvu9
	SqAvj0Qdd8aV23QPHlkMiW/E=
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id ada2fe7eead31-78a4aa3506cmr6713751137.11.1788786046856;
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id ada2fe7eead31-78a4aa3506cmr6713717137.11.1788786046373;
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:20 +0200
Subject: [PATCH v2 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-6-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVoYKlet5BEdF1OEjdeDKF+CC9/cDNCyhAqO
 C0NL1jHwCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61aAAKCRDBN2bmhouD
 14WZD/4rXDWg0PmMoA6VCJqIYCdWf2B2C385vSgk3FZWplp0SgmTcNpbmjOSPlHGniaeJhHigKY
 5eWv5VAbVWk0RbXURY7nWAjuiT5wQU1BD3TKph93/rCeSYv49y6wMgVF5/n6JgsnwFYsoQcCwCu
 cg4uhPP+nBBnCqS2U5p676DWciFeYK6VSt+CHjXqVbwSKOG03hMlOBOEstfnCMes62cVn0PNRjR
 hNwbWj2uxqiJ0IanXuzipepLUVCtTRkarlTYqknoHut5aWnA8rEKMyrtODemUluLfyO9o/v/Hlv
 CpkkImTeuXnquiiLF4Cifj6awb0uEhNFkCEY+JPEo+/IERu+HJkc9WkX53OhYAmXIWhAnjNZAaB
 UD1C/5I0xX7mNx1bTqgMGyQgO598ksl+yh9kVNPzPUzR8m+W4iemj3IUvonBxSNMPL8F1lCY3vs
 rq0JLcBWX5Be6azuvjAQxPCgthxCMmwBJdRdDemMHCG/gl9gN9R9TwffIZLxQzZaa+X42ZUfURU
 21Kl6OVsZ0fhWUuq85MJxerUaNApLgJ70HKbgGNupaTC8HR0O8eL6kW+60yAZ4Fjc+9YMf5A31G
 mL73oJ7JYyv3a4OwP7gZGFjiZERCRnFiGmDpNyANgLMTgg2ArbPMTjvCuOeipfZySPx+wkb+G2M
 S2sUfT62evsbUpw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9eb57f cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: oiGtmWMYeUEfOjgQrpMH2CfkI9yIl3WT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX4PioXEfsBmJr
 qziCIx0xjKygCKYqfS1va8Cws8DyFly5+x05WjBOZ9mnSp9RKvzNSbWfBY6eDql+Ap8DUjzW83o
 p1gxF+ahvcHkq84S2vWfsOdrKr2hHLg=
X-Proofpoint-GUID: oiGtmWMYeUEfOjgQrpMH2CfkI9yIl3WT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX6bo876BZFPA5
 FzijAOkTAaO2OGM9U/TZWwoaONTXhHLFV4oubW6/MLGhk3/VB8PrccyObNbwTsbCAHXd1bxH9f7
 rO4kuX4ptmLcOhWsLwGX1dSNA+Y4Qe9E4VgMg4/3Il+dP2Ki/wyu05Q3VDRHRuAjTxSOOtUDwcR
 u7ihL2dNlnCLwRG3xvnkclS4FhP1D+sInD6f7M3YAhR3y/6XFEIEK66Wt53SNatcVggFD8aU3EA
 OytBswFqC0khmibq9VhM0NOwJu/j5kPMLjY1QZyJmVpMhua4KmRiE+e/D1av7vgMjVD68x5TyTl
 zgqeitchJpRXev/uoz/sWjS9qmuMN+TGShS69NnFmQdxxfJLuFUYAtr1Xv02g/nKxm4VRg2z6xD
 HHy+ZDTlRBuohy1esSFztiNnKs2F6mXGheTxBQZCJ5B23iP1fp5yWnimoBZ3mzORDuXtPJJnV5U
 kfT+Xtz4XrEPFeifAtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0

