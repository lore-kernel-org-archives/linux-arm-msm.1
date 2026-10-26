Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014241;
	b=wM+IWXhvOSYtgCjfuwjjl1NWtwtj8n/YodMkQEqnAfOq8h7HYg39ssDuz9RGBS3k0oiD
	 7Z+B0RXKAHBjltRhv5ck3teDNSm3JtMqHskTY3mMXE1A6KkcJB3s6QChlVgpmnlIzL4FN
	 s+OsV1vlhIxiYM6a6iolzRaWhB0aILwh+/I1885fH8dd/GfshYKUGKsJPHAFfco9dn6c5
	 y1mMD6YD+nw7VC3qGmGZbTUn0zu2O4uq/2v1l8TUQYYO9phLNmTOZS+2mDYASiA+x0JZk
	 EeBz2gHo3BJ4ojvnST9mwN2rxY3I138uZGbVt+yuF8Cs84fOhquaeGS55JVqUqk6eLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014241;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
	b=s4WA2j2HmWVxtlnEE/vPAfWQIGDaVANghraMXV+PHDi8ZfeRmfgYQvbdMOrxq9fk3ESj
	 MwVczkyo2CtTfTmebcYNTEFHdTZsF6huyasEzLqYdRBcI2k6FroZKIChfw93E1YsxWS7Y
	 acjv5GlkdVSDJElX1pzoMYNL/jUQLCirTz38pFIQzND0hxNGfD/eToT8qDYICD7UgVpwv
	 WU3Wni0rbJ8Jjrfmo19Fa0ESobdYWwwqe0jD3KxT9TE0hhs8q1t2PwWGNr1kAA8WwGP4U
	 HjLv74WdkgXGkPKl+oNTI9bm9l/egxKP+l1nDsrRip6OClruw9Nwc2Xh8laPzCGw5SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E1660A2625
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4E1660A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kBVrqT7D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1Okux83
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtIBH3085625
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=; b=kBVrqT7Do5kCKYQp
	Xr+mV8eG5A3PRn+t4jCykyOpI0aLy4kRLbT0eqYs5BGCTiFp0xi3RPAbywuU16Ec
	2GnRgzxKf2FQmmuMnzcza3axbUK9txw3KndVGyWSmvpoZ/eieS3gVwNhMeMTHlsx
	QiuJB7g2a8wqCqxuIiaKb+eclt7TDVPZYpEwkJv9CqrxNAzLh15CtS+X1kFcWmjt
	F1wlTRFtS0TQ/ejC14KuhLzbQNBnhaC0nBKuXBANScduph/+ABnNR8+2IOfBWJCQ
	A4Cosar1pPM5lxpHB78mEY9dHyg+/VN4ISyIyYZBd0aV+9T429kVr349GayZhym6
	LzHW2g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmw3p4hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 11:30:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-89e6ddd4554so2190791b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 04:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793014239; x=1793619039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=U1Okux830LFf1hdHdIHVNty2/Z3B2F7hxKRv4jEbOJl8ePkAjiwpS6156Yib9PnHl8
         b/f2OwSW1Znkz+IJIgSpjsv+g/ChwW7n1zrMdAo6m2MlDkmPvAUfH48M9+SGD7AGW4rY
         TT4zVCPDshY1mmW1fo2C7IC1ebCc9oEGV/JfUZSg+t/s7bgIK/2f8VgDMQd2Q7CWVXGR
         3ed27hmUaGkwvVJqK0anOTg/1wRrlJf2I46zPMbe/R4qkLZz5v1IbcARRkpouFS07R0o
         TVrGgmWfkvk1ufkNPmf7bSLiLs9J+e7ceG0UsW7c2P3iZW8eUEIJKKV5jofZFPcr8AAn
         UhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793014239; x=1793619039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58lza+N58sloZR6E1LzFnfVustAf491GwYyn9ZqoTSk=;
        b=VDgVnk/sIFp0XS0pWUalVjC/7QsH/fkAVU9yufptPCbG6hCKlcZdSmtgtpRovJ7pfe
         1Mei4AiX9e3EF9MohjbkOZuosTnORRmBOjvmD3z9hen9Hm+5yXWVSt+xXGADWR6VK+NG
         IxC1C7xsoZ+jvvhUmO9K0pcllll7ufP/2/3/GeQRgfUZYER3r0hCHxPlMRjM7B2JmDkV
         5+SfTJtt/BSgSuGnRwfmnqeH+WOv0lats7+OgChkdqxSUgvDbFnQL6AtcwlBAjWB28kb
         MhaaljYHVGMZDhU/NitpML4BWCuM/x2CeUfsi9eqHAWCJ+PfRvRlBSICfZgy5FJGihIX
         H8Hw==
X-Forwarded-Encrypted: i=1; AKwUvByoGs2900hxMiwl7TbR2iPR2niDeclGlZLZ85a6DAzrd+gvdlyPMhXLtvpxq0b9DlUrvpmNuj/k+Eo7AyxL@vger.kernel.org
X-Gm-Message-State: AFq9FYLOA6iZWKNtCjqVbHwOvcQ0nJNI0jJUFDA8yLQlsVWjMEjOSHou
	LK/UI0tAa21rgHe49QoFTKHhVeSpmCTifSsaqk+K0tA7QQZsA6FwFblcfM8+z1xXAuvNkRE1aHf
	lDB6kz83ZhOhXjzZ6HnkHDju/LdfVxQuyVQCmKqMH2rfVIQPwQGlmza/zJ8XvnnxWAdag
X-Gm-Gg: AYBFou2CyoPwZj+1VCeWvBzlQJOcOgUyshl680j7GGjNtRuiwLj62Mlt348vJBs9bmW
	TvpqAaabdBfCTOHVBjb2sJFmG+fqC3ujnw1UWQY/Ek6pawf5hFX9nhkUqFrpthnhSEhYrzNsgdI
	TFE8GEiQ7CjNV336K1fgrxWYO8RS4y3IVkGndN7gazCNaH30ewNFgT+eZttock5E5776aVpnnk2
	Fd8CdKkG/UCmA1o5HlopvF+qTE3+eo5fbv/EH+f7AUgBuTpUTCGs83zuKM8PLisQefwt40xZepF
	3TFK0zVgcXgRG6XeT10sHfqnQUI18GZrpUTGAeCsNVJmjRotOaKq6Z91pz12Z5vmuEGHqQzmaho
	68apJpfC6pToqSf8dPGLnCxs=
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970130a91.48.1793014239429;
        Mon, 26 Oct 2026 04:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:528a:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3adead62207mr4970084a91.48.1793014238806;
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adec0bcb0asm8020388a91.17.2026.10.26.04.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:30:38 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:59:33 +0530
Subject: [PATCH v2 07/12] pinctrl: qcom: sc7280: Add gp_mn mux function
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
Message-Id: <20261026-b4-pdm_clk_gp_mnd_v2-v2-7-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: cEYjbuKPwLq-esSe4ws9-MuaxS9PZMRZ
X-Proofpoint-ORIG-GUID: cEYjbuKPwLq-esSe4ws9-MuaxS9PZMRZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXzTVyOYmF8x+J
 GkkQBRIMboiqKNobd0Lzhc4IWFd63ssjuYnr3rdBdeTbTAykAYAd7BxyRIMt0drbNKsvs4Nx7LU
 uMjSH7+k1PNl54cQEVYkXWzUMuEVf3k=
X-Authority-Analysis: v=2.4 cv=HqHjiETS c=1 sm=1 tr=0 ts=6adf39e0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kPUZkI3t5WzYvoQfP0wA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NSBTYWx0ZWRfXx1xWCm0dc59J
 VpWAhW2g8p5NwzQTyDfXNuMZOeCKtb4RDSR90KJKaOXYoMMOe3+q0NTdEMgv3MVOsuvc1MVicxP
 Hzxl+zjI8ZFd47bNdURqZBXU7XUAQI7+gVapfOB2uilc+khsZF7qEP6MWz71qqmOSBdrBGNKBqr
 prkrf57K5DgiNVbJ6exQzUXaP/5FsrC5UYB/cOdG6VTlkg3p7FBS7UIPZqPpGozMHPu6x7b4g03
 F2mzcS2VfF3HsZNK4LByuKTaXi525gpjsmlQzxFUHo5uT2DW9ikul6moUt3xFOVYIcfQUmLfMDc
 KqI++9KHjGh+0WCMLi5DnWFfP4LgOru78k8jjGapCOYqKXHltQ26p6CmWEkMQ6QC017lyk5WzCP
 ESSGOSbGggS5g68o697OU9eQmPgjysKVPt8kAJ828/s2qYbHYaag0C32jiGZDm/nzI5g/wN4YUF
 Hs7uWarWdhy4ok0n9MA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260045

Add the gp_mn pin mux function on gpio60 of SC7280. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index bb32a56649df6faf1aecd470435d74558c20db27..5e210b399f88f5beb68e511bca9c0dd93a1b75dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -515,6 +515,7 @@ enum sc7280_functions {
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
+	msm_mux_gp_mn,
 	msm_mux_gpio,
 	msm_mux_host2wlan_sol,
 	msm_mux_ibi_i3c,
@@ -788,6 +789,10 @@ static const char * const gcc_gp2_groups[] = {
 static const char * const gcc_gp3_groups[] = {
 	"gpio78", "gpio107",
 };
+
+static const char *const gp_mn_groups[] = {
+	"gpio60",
+};
 static const char * const host2wlan_sol_groups[] = {
 	"gpio26",
 };
@@ -1154,6 +1159,7 @@ static const struct pinfunction sc7280_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp1),
 	MSM_PIN_FUNCTION(gcc_gp2),
 	MSM_PIN_FUNCTION(gcc_gp3),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(host2wlan_sol),
 	MSM_PIN_FUNCTION(ibi_i3c),
@@ -1325,7 +1331,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[57] = PINGROUP(57, qup16, ddr_bist, phase_flag, _, _, _, _, _, _),
 	[58] = PINGROUP(58, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
 	[59] = PINGROUP(59, qup16, ddr_bist, phase_flag, qdss, _, _, _, _, _),
-	[60] = PINGROUP(60, qup17, edp_hot, _, phase_flag, _, _, _, _, _),
+	[60] = PINGROUP(60, qup17, edp_hot, gp_mn, phase_flag, _, _, _, _, _),
 	[61] = PINGROUP(61, qup17, sd_write, phase_flag, tsense_pwm1, tsense_pwm2, _, _, _, _),
 	[62] = PINGROUP(62, qup17, qup16, phase_flag, _, _, _, _, _, _),
 	[63] = PINGROUP(63, qup17, qup16, phase_flag, _, _, _, _, _, _),

-- 
2.34.1

