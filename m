Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C95448394
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122601; cv=none; b=QofDK5EbiU2EXYjb/iwiWmXlWYAl9dsFkxp/X6ASkSJInUPM1yVbtRYIbo7t/g1LVF2cqJyQlFvvdrvliGYsEmeF8ufGjJtHULqHtmFEhkOc9nJnZx6wvcBaUZLmHlJrpXs4htk7pzkZQlZ2zHHiZekc+d1Z8m6WNPKokdBGbac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122601; c=relaxed/simple;
	bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tXFTL94+lUXQhnVFBbcqUs5T5AUKVpZqROyHRo993cw6AgY91QWuIBW6imCQ5KzaFKTExfsDDxmDokRQhu/G1ml35XH3luSrT1KDWHKftFTG58NvlVZ4Pyz0LpDuZECd61Ju9TB7ncIDjTEDLDvLEIw4YmMN83Syz8sd6i1YvE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pHksfQeY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G0yMTHjS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pHksfQeY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G0yMTHjS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kpNq3513946
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:29:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=; b=pHksfQeYf+c/aAK0
	N6tQXPebPfDYihRs0gnVQe/eqzFFTjAB8xAzmnM1YHLbYxJw+DxXVzC/80mhbH4I
	BXRnlakj1LB8IQrGWdsCpYEbKmOZB9yTLuLn0YbRvPECzZzQLMiFrU3Yp3NkeOb1
	pBMdk7NEnG1IALukD/ZEoPag1T3r8Rv+i8XojZORFUdEVwPEIKIadbwHIG94rZ23
	SuD5VwUoZ4WfKYKdqq2LOZfZLYlri6UlTBoEuVBk99+oZQIKtT1HoG236X9xqJ47
	a50oV1cqqUjLzIDsk58okArCct/ViYflsBt7jlCb4ffDZ7DNeOSnTG7jTzdUSyyP
	mtmCcg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd51637-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 10:29:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93903622880so384650585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122598; x=1789727398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=G0yMTHjSJMVP764Y8/V80FXYuN+PlpIQ+3rhkO1oWMH1SfEo1hnPrv8lhaF82pdcTe
         2xW66Yqo8yFXObMUwt7sDPEbQ8dZ4u2KHMnwz2gCiM78IFzosfJytKnFKLoQ38g2FB3x
         /rSw9VbJit+wOaeOHLyb2LdFM9u21dmiQ85TvjQVYhJ+tOP8HJ25NE4bItftk2qGejhg
         Oiqyg6JHtyoBoByMWQo4jvtsxnElOMpomRCcWYyqdoCbx7ZiSBXYETzJohoe76po9UCk
         JiYbzJ8jYRgKKYVmMq1hUPRhfaOkQrX99atESFmz+mYXoN45fmBPb2sREbLTrew9AoJV
         nosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122598; x=1789727398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0C2reVv1oSwnphcZX04pJknqbbG7msmctVikhe2z4c=;
        b=i525/OlkBdad8YwbZcdCKTooaSes346ezPLetMIQTc1F5D/KHrSkk2LSdMVEutzKzj
         Lq946xzl98kANic4k9TvNRVcrwEIxmZ8G3VjK41meYWSn09pOFMTXvS7NLGwUBlTfQYL
         qZkFxWRvXIa9x5oLUzLqaRDbBgHuA1VLXQr7elaceqyMjByE7IRsBVbGj+ntwghfpI0L
         9aAe6gZSnloozgFGsSIhw13hIN+iUd7zNGKoit6RosS4adVfQiD5dy+6reV/ElYpZHcq
         67OaD+7VDFMhiJ/FGiYxuHcWfWymSi9ntPjxXLLt1VrBM2VBeV6RAJNhmyGg58FDhsP9
         BpPQ==
X-Gm-Message-State: AFuF++kxoOF3Y5Yycs42Oa2sQJqgUarDsH19y9h/l4vliiqSkTI4ZuD9
	C00+8JK7V5P/dGgs1uBX9dDTqeGEf+Wz+SiE6EpE+rqhCZmpN9eCny68wCGBQqBaB/k/VBrw/Ai
	f4a9U++UooTXiJhbokvw7tZlpPGC11nQE3yLQ3Xgpw0Gy9SwIiE5oITMLA33tsB5dI6AO
X-Gm-Gg: AYBFou1d5d20tJKGygGKrwcOb3dAnDWCW8QVyqZj9ShmrYZ+2NSqyjp0Ea6Me+t+98t
	uzfMhTOpRqaKmqww3Bbk6L8USyfyotzLjRA0VzdEn1kV9KyhF3gqcMLedXduzd5ZUV5/sJ1sspr
	GrNnBhnZYm5W4K8u8AM07zncL2Atyc+QmTl+tJxV6DIZoGgBGHQsy0rVA0HNRDYhVwmLeKRiwEB
	eUEiIcspjLfNbF0VCz6zV5xXINmAtoWFZO+5+/SYfi0EKIUYtDeWavjCHZhODDKbawY9nxf34AZ
	yZyOrFnlV/HaU78lC+A2xsDUa4KlI63Bde2Fns6KpK1fouj/yDL4vqBNXgsn5cyJawMmlOUjHP+
	MnRXu/N6rdQ7fePrjM/V6T5A=
X-Received: by 2002:a05:620a:450c:b0:937:6f98:c68f with SMTP id af79cd13be357-939d7e3ff2dmr1128907085a.1.1789122598384;
        Fri, 11 Sep 2026 03:29:58 -0700 (PDT)
X-Received: by 2002:a05:620a:450c:b0:937:6f98:c68f with SMTP id af79cd13be357-939d7e3ff2dmr1128904385a.1.1789122597996;
        Fri, 11 Sep 2026 03:29:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:29:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:37 +0200
Subject: [PATCH v4 4/7] drm/msm/hdmi_bridge: Drop redundant initialization
 in msm_hdmi_bridge_init()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-4-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=909;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DVXNSz/QqITCQAR3c9vgiIReGo6sp1REqUL1NIZWtK4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gTV0/YW3nDgV588FrAxTLe9cG52WMzAMMYr
 NKI84Lz0GmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYEwAKCRDBN2bmhouD
 12GBD/9RqSUlV9uXlVhuHr2uUrrhS6rxshyiGQqKwcZ7ksHEN5NVwnshts1XzecGukzkys9Jjl9
 GoTlteAOfZpaYwvtJ9iN+XLFs54jScHcP/7eqO4R6Z/cKzQjeB2HGzaf1UTUiHRqBBVDQMhUo+A
 RBtZcL+7XmiQVESJ9ZpMmyo+0xejSPquCYO45iV3Np48YlEA1Dl35EjkLhuPo5XU4O7/WrP8tH7
 lts6l04ekv7YMO97ElLTS93qNnMuZ/MuR99FosbezHM59KO33o4XtwVqJGDQsxEiMY3ASamii9q
 5Ljuho09Vs3yTJCvKgNDmFWKxcj3TyshRUfuy00mRPnF1AnpoTPNPjDxU1o0AoX/sCXovf1rc1+
 pkrsI/9joUx0hs/2AX/9HEkoTJOZCxeOstg8vPkIBLY/OQl4HY+6coP9jkOwP5Hkiwy6U5ad/lT
 CFzm6wyEkaEixq/tq8YJGrkPA2oRPWqzD0vJUtxIyNmwXX+gvd5fbSSNhFaET6RdNjci4/8REGc
 zXAtOBPUBFKr2QR3L9hJ4QTKTRmjjBguyU53XS9CEOscIWKaqPXi23wilUDtmts2WJ7fSEnbSGr
 X4K4Ic9vaJpmQZom4HKVt4NSBE4JA++KrmJ3vmJ6nSWR6NG/Vybn8Kuaoo+0nVncsVlj6eKN8iL
 zd/lzs+F9i6/8aA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: M4NTojT9eF2zK3eWmev6PGZovPwwnsWm
X-Proofpoint-ORIG-GUID: M4NTojT9eF2zK3eWmev6PGZovPwwnsWm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX947JfejrEX/q
 kbV4rlonwc6D8Ibr+4llioDvsMSB9RV7RddoH3Zwt/66JOneEMQIKYRnF5FRYwsKlELyBCO0XUV
 a0qR1wfs2RJmlAHVVHoxXnBBK4Gb0LQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX7KaV8rtDbqqg
 QkXn/nXHKCiCwXtpv9IJyto4Z9dH1soMg61mePuQ2e8Ab153z2y+8IfCQKDk9EVaDbD+6YYMDZF
 n7m1AzZwFt/kHSi9Aa7Nm2RNcj7fdxSbH0QE6xtU6bE2phMC7l/V0JGqQsycBxsuIm4OsywvOA3
 FnrqwmIeKnWM3roZv3yL5B/5cMzupeUOPkFJBHWfEP3fGgGR0GQa9mJs1bDy0Y48eDbKzXD/sE4
 0KhtCLopD4MdCwjWzryKSr4JKwOuJgvgl7p0XPaiqwbaa0+ryltGwRw2we7uiauBCNG0dzI3SWt
 9Q5sCV6WwCIm431ORQxLjynMGttTbzlQllEiN0v3JuZy7/XT+YyFi/UIXscdsNHyK9+kvXmqttp
 pgoGsWb8eJLSYPwxCIIHQtLAiTmrN6oaXqKfVmA86qON73Ot+ccOvPULNw3uJT4djJ+AtHp3zLW
 xQuC9vvG+tWfLjGcn5g==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa3d827 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=RZP3y24nY_lDZDhlvS4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

Local 'struct drm_bridge *bridge' variable is assigned in ~13th line of
the function, before any first use, thus explicit NULL initialization is
not necessary.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1860605850c9..49587927e8a5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -484,7 +484,7 @@ msm_hdmi_hotplug_work(struct work_struct *work)
 /* initialize bridge */
 int msm_hdmi_bridge_init(struct hdmi *hdmi)
 {
-	struct drm_bridge *bridge = NULL;
+	struct drm_bridge *bridge;
 	struct hdmi_bridge *hdmi_bridge;
 	int ret;
 

-- 
2.53.0

