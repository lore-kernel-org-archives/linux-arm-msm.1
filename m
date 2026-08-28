Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A1447012F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925938; cv=none; b=KqNwXlXjvchIdVOjSzEtpV6JCJqzgyc/98/hdAeG8Xwrrs7MsS7+lJPSMh31lDN3cWNWacLVQYvW0QC0NMLivXpEVrgI+JRsqeXBxQhRfBUlHdt2QIbOmeTpSRPHCAwhbPCo2wMUpYu2ls8yDvt2zXdR4jds8mswQJf5jtiElkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925938; c=relaxed/simple;
	bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFk26z0bzQo8xDC/B2SK9ruWtxtSeqmHfba9hAD2LLccDEJJ2LsSpD5RK4SygjV281HqpQObfhBy4BCiSVOI3IC1usPKeZyzlYOYCo+JtNStv5fqSbFdL1P9eYAdh21D6wDzPoLzfjFa6046tCcg1Y/1O+MpVDeiN70oYEyHYt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lEykGVwz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=axWKx8Sp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lEykGVwz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="axWKx8Sp"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkrlr2059307
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=; b=lEykGVwzCrMDFdeb
	9e+QDLAcIZ2XB7THfDrgjzLic1KuB4Lz6y2gR+ZXQ4RPwS0x6qbaNYL5rZTIfYMz
	j10wOar/678L1YAwliMD2yDQmxixLCvu/4SsB8tifv3MszctofHUVMQcYb1twJNc
	Eun6mwsep4wEJvzvFZH9r7DruoazC2p4161cRML5mSHW1o4uzF8vsRVmBfUppO6z
	1zToiG2xEpn3SZtegZBG3mvoGEN/uXCizrqgQcQzDhV211VHui2YBioaRC/oHGSf
	01TsOUHj0lWEOJd6G0eQhz1OWzqNrqbZDCDOqxHdsFC8ReESkkGjsKYs0b6L4kbS
	gRibDw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbag9r9yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:35 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97bf8de7d8cso958857241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925935; x=1788530735; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=axWKx8Sp0pUWNyMJ3595ZkfajjWdK913Ig5bh3efdelYpa0Ze7SoLsTpC2Y+5xYiKf
         whJTBXECZ261x1DeZdfhCkgwBmKWkj+pkphCC52zmby+6w0s+gQ/8LY3u+KNhlSPG0+g
         Lmxk6juZHPNJr56AuBvWpq6gs1KWY8f3ZzaZgDhGUsBfi8B/1kFQB/luEF9SjwVw/6en
         FRJkvjZf7uCQRCumofEOYXCFi0t4cQCtj1atfNlRZ6aslE8kDUmVDaGray1NKZG4uYm5
         XPUWlcVp9CQu67IBCCBYHmpTFKut4Y8w9L7Slqa+8D69pSBywrW1Lk3V0w+P5hh3vjRx
         buBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925935; x=1788530735;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KTDS+bbOanujBaA6LavrEivitiq85Hyu7Sk6HDc/4Hs=;
        b=sTYMafJe7LIKQRM0uJFyjvubfS8X0GQNDlO7SgGCdnsCu1JwZVmPrULAmNHzwtoscE
         sY0SHlVVRhnVzZ/rlOu5+uuyxbr95sa6F4hCRnv5H35RYuiwqFzRlFN/BhJa/igRw7jv
         B27sSc44eE7arw17vG9bJ9NU/B6Lj2X4q/ePdwcOAO64yLE+PN6+tAf1JqWA5zCPwuD5
         oSHX8A4Eb5hbpVFfjS2uqDYVHYuA3AProBOJlXwNxk0tCv+ui/aTZAWjj0mC58ugSJ9B
         +vFz0jy+bgvLWosmPtAcu0y3yPb2or46FjHCkS5phnLMK6imsFXgeJVaFHWYnx/h/9cD
         +Dkg==
X-Gm-Message-State: AFuF++lgKFyUsggU67JdmsXkgzUP6WyczxVi+oMRrO43FrrArUF2ld0Q
	sDgqaaapcra/7O7CoNffk/FsjzLj3u8P40M+0GjqunFt/+qBVgze9EhdQD57eA44CuHOzKeeth2
	DuyL7zVmgpdKy3SGTj89xaJ5O9KabVSEGirfE2cDLtG7Xe73KLr2pSOwzT5Anj5+G5C8v
X-Gm-Gg: AR+sD114Q072eBmeULN4Y17pzsZMnpRCZTPgRj51wS+D5P4CXmRFb0yTSA/+zp3gQxK
	E4+zNe45C4Kyc0gNokqa/zee9LWjTiDkK/my1Aq9YwM3CGRm4H5xdoin8u8FyMnU2nFD9/rm/8h
	v+0l/FN15ZOj3xYy6csuo4HhzmeCWw5mil2eXt0d07sBfOVoCmqUDKPB23KF24Q3twD3ipQZjnc
	NPwPo5KNIk3QfEw4KDes38vGgVBjzKVmbnF7wUOX0BELeB/yMo43o/LSdEF7LJ59tbzv8tNkSNI
	Jr2IXhZPqhFACOArk1PFLVPX89ESWsRLbk3te6MusqMS3FiYhpyrJmIhhQU68b96tTmJm8Phh05
	kRsZcacXsZ+9WIQ2ckQnz7E0=
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2597987137.12.1787925935038;
        Fri, 28 Aug 2026 07:05:35 -0700 (PDT)
X-Received: by 2002:a05:6102:2acf:b0:778:f972:32eb with SMTP id ada2fe7eead31-7859996dba0mr2597945137.12.1787925934482;
        Fri, 28 Aug 2026 07:05:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:01 +0200
Subject: [PATCH RFC/DO NOT MERGE 03/12] drm/msm/dsi: Fix indentation of if
 block in dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-3-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=798;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tW0/V98WOWAWLqVlgzVwKvZe5FLR97Vr/8EkD1Pe00U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWaCzqQTDLhYUd+TYlb9MS+fCMLIHN5sEpaO
 KPln5AS7zCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmgAKCRDBN2bmhouD
 16g9D/96CCnowO5YVeDTuX8794l+rCeRdeqVNKtfJ7zwdrh5WdJ1dnaBPBMQSnm/x/fVpcxwCYu
 arC0rbwF5A7wOmGm7T67qpA8GmNSqNulzSXmCVkSor9+y83n6waSu80HeiJy+iOntdvUy5hLmbO
 mjarJYL+eEfSYcMiZhIWtpuhYjg0diCrLSbHgFm1UQWm73y1MkDp/S5DsGL7C3ktzxnuZQYO2Z8
 R4tRxhdMzWCwB7HwMlV9tT6kM/Db+SG9OIj1ArPRfVso5lfCZ2sZ0ZsN8TVqxb7w4X2E2P/fBo6
 4aRTdoh22A0wJ8AxWOspRf9PxjJUiARGPpbZwUNK+T4VP0elnJpLhFtaNYdN3rbGVHA1YtLujYt
 0oAeXdDz2BNXUcoot5nAnzMSAFYgqWrXS8Hq/CyCx/hqugWNkaeSUC0epfc3iODek6SsXRzVCI7
 4cxwygFxa/SACEtV+HF+3HeeY7StL0m1q226kw/Nyzn+Ff1iYSsoH0+IORPJPH55JXT6wrHPle6
 +vxcw7ZqLXBglLtY4iBj7vKRtmfgnzmehfxap7F5BFLHv5/EO9s2pGT4faG16ueVDYg5Vi1RvZj
 SGKY58PDV4XrKY1s/2y0e8+1Dtb9hyNA+QGRx+e9DmbOKA7c3OZvRX4v8bjJPdQo5TVQvX+dAfF
 pNB23JQaNvDBvLA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=UalhjqSN c=1 sm=1 tr=0 ts=6a9195b0 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXyPguNMVWyKBr
 r2JNjBMyLNzuVHiUDvWmOLUrCbPtBar3oEX9ZjL5jwWPTa7PMo5W+9mhsXCDdM0nra2QeuRX9w5
 3j0tO2LoASXqb6aDmg3HnBgC8X4s9og=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX7RTNj0Lfk3V5
 wlM17HbfH0HR0qZete7wixHksdF+CVDvoiyrdqYThWJa4iMKV58q2ZOsHbMpcM5QEMWJulHkm1o
 yLDssGul5Bz+TVw37qhnnk9Mj25eVUaHjyZQ8qY6LF2VlOzd+UC0E4oIY0XSn0JEqMIadk7vHmN
 qZk7XfM+eRv6Hjmrwrh/Fqju7e0BZjv8cGszit6Y82rGMBwqls4gGz5I4AomQjTKvmwH54DId7/
 4hEhLiecujZnTvRcdKiKItRUiVXDYUgcEoLDpnwWvL16SJD1KOVH4qYQpjSiQ2NtlKPvw8Gzk/7
 nmWei7bU5XhNqBholw+4AKl7O0JKUs5xMSSbh5T0yhZwvkGXTmQli5sDrJOuVpHaoUwr1w+XQZO
 MeP9wn2JVamNe4ez7VLRcqP8U1yU5y9GZ2P8BoISheU0hay41AVUq3s/geUJuv7s98KNA7Kkm0W
 piC6jjvCHT0NWTI7Jdw==
X-Proofpoint-ORIG-GUID: ewjzdoaG4j19Klkm9N_3z_zsAID6yUUq
X-Proofpoint-GUID: ewjzdoaG4j19Klkm9N_3z_zsAID6yUUq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280122

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

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

