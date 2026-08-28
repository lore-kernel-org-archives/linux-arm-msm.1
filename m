Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E70E469842
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925932; cv=none; b=OGWDpqHgdsI009PFh665/bz2ZerCNag9yihmbBllg3cD9ykISEQGHk4vnFbbvXx58zUiVkuR8rJ6WW8dzLjpuRUzQeTnJo90SEIhA/kCRRiADKrUk1+Qq1b6E45sPs1WFPMq6Nq63TpaPe8bG14RikbGOsWGw98yQ4CkOaV/2qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925932; c=relaxed/simple;
	bh=6C7io++CE3SQq6sBfunNn7UU9vPIt0aJqSBWy3h4kY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JnSv9r2/ZQBmGsgdJePphmkBs9bJnQO/GcCCGGym6l8n8f8b3uiVQABl8N7hYekmplyyZNEKMuahyrc7J/WmyV3BsyKvR2IhldQWg3lXsuZLE0RL5XjymewCfJJpYfiOb1oP20vT7OHVVDek0KYg7D9y6d1bv4tGxHkUvx/2F/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBfhaVaC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oq9eYaGr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBfhaVaC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oq9eYaGr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcR03279767
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=; b=ZBfhaVaCZEfk2qYq
	ML9UNTOdC1dOx8kAWqDYk00AixzNQGD6WaOideeHLuvOI+h9hHSKgOxxbfOFi23e
	8otwA5vS15tbgp6/A27Kbi7DWKX7poeM/Du7MkppzH6mQNXlP0Z7SawzXujUMv+w
	WV3Uh/63GjdLkDtVGDE86Lm0E0afZlpRNup6hEngXMDZiFKowvTgU1EAxfK8utke
	f/HhGfcie1DePr5yxCiInJzP/NxENG1LnWZ9S5TCdZw7wBwmw/JNA9WfjMAwI9pB
	RIQRpS9eAfuyGpp/0qOsivnDYxPuTERyepcB9uyDDunjISGuuI54RUkO2JrE3VgZ
	1xbqAg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1gj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 14:05:30 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso9487241.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925930; x=1788530730; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=;
        b=Oq9eYaGrluegTfuW/Rng3U2l4pQiYpIIAaj0Vrbxb1ZmuKCB49s1TWvkifHjkm0Jty
         JwwQsc26HFJCG4wHTCEaNkFpy2nFH3Q5PgG+5Sn+OJ2iEzhZqLBeDMy7+eH2uqXSI73M
         zKkOFa9M8/XmxZQ0kny8jpD15dg60wk8A8jWEk4aSfcqDAXJ/9yAQ4qbJEIgMnTyIeQv
         AhJ2q4pLKCv2FQAQvLr4JL5OnzdHgUJ8KIbBIXdaVcoZHqdhbltOQiAP5JufRvAQ9kBp
         bLbf4s3p0qdYT5kLfgd8nc4KPSIiH8nF5Yb91fAm6Ei79Tito3GW8yRPs2NhwmILW7i0
         wAlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925930; x=1788530730;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wwJXfsloAAB2Apjdz82YrMfdU41yJCnHm61R07l03yk=;
        b=PmKHwQ28btsbHWlfdPcsIOECuEE32o716FOmFpfWXsCUnb+5M0v7Zg7yW5vMMU2tMx
         lgYG/4dzPzA3IX7LrPYHT0XnKmGNjuaFJF7ACig/q62a66AfGUJB4joMOIDJVdxZLXi4
         9CcHCpqsTevOvtXPNuCL2NDNr4gSv8puDLNfyKAMevajMwOnQOnIWxs6cc1VDzVIaFNv
         VCJ54tUSqZ9Fw2p19REtV/LNyURp6vCu5+Yb07rpPGc46gtuvpUO3Xc7l0TEVjMFCgSR
         yrypxNMX5EnkicS2S5TjstiSj++jTHZ2MKaDldc7bFXeMdXzhBr70TCtqa2cxIbe9XRt
         TOng==
X-Gm-Message-State: AFuF++lxvV9w2sldPFKc/BH+C8j/J8q0ut+ftYlluYGWBTsYLsRWSb7A
	2QW810uKbZCdiMtxeMn2qrs9Ys9VJ6rgEqoIAJw5m6eUUMTj7oQK3TVfPDjZXn3fgjjp5/XnKOe
	gDNSO6I6Eslf/VCqGGE4WDWVQXc0GU4rNi57ji5cXWc53w/PNKrLPY+NR48qZoCPV2Y/g
X-Gm-Gg: AR+sD12twpGsb6mun2f3VDoBq0tvj84gi3eGHMYIGkrBMGiVQZZ3AJyGEFqBoCHwt/D
	SP0Wjs2tzrbgO2tketGIY/H2zTN1a88xgCGGx2rzFgjKIEVd8F4kT7DuFlN3ZKKqaK+2Fcr3YCL
	IyDRGF5t9pJp7YylWBMKwHYFrypmj/tHkcU7VuiYZBf/8njXMd4ixrX/ADiC3vb81HN3Jj++9xp
	dhZ1XJDlrM5zZImOWbm9sGGvnq3jqFaacMOmiPzT2Q4Nyn0lvsYfNS+EDm/zvh21dvuH1+L2UQX
	3OoI89IQgCvPtYSYqyaxfatwvRvSNtVZsDVzFaX5yZE3D7BjeVaJNPc6NkFsrQV9hLGoEGq29wU
	Z95JsJNVV6dRRAuIC5/HSklU=
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr2106162137.12.1787925929618;
        Fri, 28 Aug 2026 07:05:29 -0700 (PDT)
X-Received: by 2002:a05:6102:14a0:b0:779:e75e:63c6 with SMTP id ada2fe7eead31-7859946ad68mr2106111137.12.1787925929014;
        Fri, 28 Aug 2026 07:05:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:04:59 +0200
Subject: [PATCH RFC/DO NOT MERGE 01/12] drm/msm/hdmi_bridge: Drop redundant
 initialization in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-1-67843277de17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6C7io++CE3SQq6sBfunNn7UU9vPIt0aJqSBWy3h4kY0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWYBkZ3ElfHZH7luw4aONZGG1TFyP5WiPuVu
 rrHWEkjimOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVmAAKCRDBN2bmhouD
 180qD/9agwFhWzbkDBY+PenlIgFa5fGuW8FDEGsNfrdhd+XlCkdbjDBPnllkZ/J09DczYm/Iy1a
 ++lWEeRO/Y49aWzDmYBf4gD3Ip0bIippizJHnyNMqkoNpBasveavJAwgAuexR0831QPXoRq1XlW
 8VWJexZlqap6O+juK5mOzyEoZtKrmAT7/H6xQK2hz67hJ2UdKwON8qPfnKMjhKi/H2qTVL9oE53
 4GruP9zO4d7Yx5oDDZYH5i39GdKPJc1qfkNNio/8F3RYxrIh7aMHcvcz6m/P7BnJ26IK6ycJDQG
 B5wKuX/lC4T1qL3ADyrwJMWOQBl5Mz2+/Er7SkQP8gpaLVoIUjNp1i/SzTSKpAsqfkXzCyy6T4p
 UEIJLA1GZ6dPdth9R7+0ygwkjQCfqhQM5DSc7bCZDJUC6cKxk7fu5EZR2/TeEP2XXP0wYU5JTwv
 Bcl05VsOqAOhyVoFBwizr8azvUSsq0ags4CeNfemlmsQ9ySNACLsODUu6ln4NELyzp3nCFRfmkI
 HoItvt6InCDWoQNHjjmogmfD4CuUf51QImgUg6AVKjTj3CateCkHuamAM+dgaBUVwb3MqZFUqPf
 h1Y+kaRm+FZF8gxrczhzedIPxqaY5tykIAMYOGoN7GP1qN7m+sbybYAIoaN40lKVSvWlkBiIleF
 zoX0vZjN29TY/CA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX0n+qHUPUDIVV
 /AkhIvZucn0Tm64dzNggSvC3yQ5caUEiKHCMtvnTQXcI68TQyX/SaJp7ISx/L+ydjo/ilMV26jF
 zv/KjPHzqReWhygWitd9iPY411MMhI4=
X-Proofpoint-GUID: 5zJp8RtVLqLudaGITr4EpUtavORl2td4
X-Proofpoint-ORIG-GUID: 5zJp8RtVLqLudaGITr4EpUtavORl2td4
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195aa cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qMQyP1WGGgURt2cF8gsA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfX2nKM/+QrW+AZ
 qz0Iv9YvP8Q9B+vL22WKX9wShWvx8W2IGNebmGQa8kJ0en4biOcS/Aebi5xH7t2gCVwsIsoUAsi
 kFcgyxJZiNJNp0P5IxBhAlJvw0iqHuV2X1J5HBE7EsBkwx9qQhNN/PvSuTqfKfXNKVJHReSLV+Y
 Ux0WvUsk3PlrwIHYDLtxkQhhrGSExftyxLvR0Zjm4gE/G0juoIZ27MwmSt0c+U4hZUWGuNUUwWC
 u+2kyGXZst1PzzQVys3wnSq7G4btQsR8/BtZ3CthEHCOOWH9CADUwteorq7lgMshkY1kzCeQMBa
 V2Z/7u8NQrdRFao0vC+MFV+4gZEsCy7cm/GrZH5ESDptouzwCWd3BBq+xjKwk9iVqjL0YxfqXQS
 QtLxEJaElkW3N8B39nL9P+IIZ7U0mdYdsRW8fiQ8608OhvbWDWc+wjZ5CSE8T2PylkHnLbEx6e5
 u71L9WtagtQcbe6iPXA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 157f19bd90b4..a5f891661ea3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -472,7 +472,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 /* initialize bridge */
 int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 

-- 
2.53.0

