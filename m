Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981838;
	b=YWjfYgYNmAPOmFdKCzOB5jvC0bHbN65wJc7gG2FADochRoCrjcKKlirSbMcaJAc8PDmQ
	 witwFKVV2MdOjK9nIK4KycFkETbnRvFhEGPEQ8TX+r+vm1FRLgsUBGrNI/UmAjGTfbeMp
	 o0fdY/voy/3gPvQ2g1d5lp1O6oZbogee4TJ/KPrEW8IQ7ulMFdRkVs4rT4UgguSU6tJNy
	 BgRdzECGbkmi6QPt+zBI1AhDiQO50SO71c+pAVT8iyAldNBYCaQ5nn05W+fwJSfUITQ1o
	 l5wy1pCc4JDoXx5D7Mit3znkzw8PnLka/EjPcELpgV2rFF5ESpqZbtEUZp7EkLjj4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
	b=a3rbswLF8sZzFiLrt8UDAPJ4bryiop+5Pek5otAleTuvYfbnqKbJWSbsPMn9IqGznNCx
	 mm/EtxY3mV1dZsA7VjhsKZykfThiaDTmq+ptIjXyX6pr+8gKJE8C0SjsBapdmzwjs+nox
	 Iy5jooNRHl0OseSxD5hZlisRQIofY5IM3vbJ8xgnAEyvsAIDN0M5BBu/BIwzdTqYiNY3A
	 sQV6vmRUjJREd8Odoq96UXqnKxPM3B6qGvnIUmmBeFDlLDRdVgRLNHyq1LddG/6jQYIVg
	 2Gos2Gn+jn2Ar5Uvhbwr5+NM1JDhqfwQiS7EwKy0/4804VOWphL4+lnAyNmVyb99rSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C21606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29C21606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WJmtjKPM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QVYrrSCa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uq2V2383049
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=; b=WJmtjKPM+Gt06NeY
	NK7I4LsMjwV/jDaDyAhLIdsLORSo/rqYaQiWaSpWB1twDhUQU7Q7LoqUnhuJvt6T
	gTR94IzfM4MkFCmoqopU6DRc4hgRbrPqWEmweAg7Gy1FKuF0zNlmE8GK0nODLdlx
	nuZUvE7A0Efgf7GVTsuSfdDwix92zi6fjBC08pxTpZ818C7ilLL/v6bbIVLPJpE6
	hPbDy3tIHc7p8PycgCpsX7ATS6VHVM42Fj18LPPS3ln1M9zCR22qeySm+TYFCgI8
	whC8OLWaUGz7iN6epytNG4S18wzeCdDzv42umwUspnl+wocUtOXfxEVHy119jNNK
	JE6yfQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvasgb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 06:03:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so7938865ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794981836; x=1795586636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=QVYrrSCaPKymmKhsag1F7lcVJDX4nu5h6tSbiitjTfL93GhD/9gkWb4dh844lxz4lU
         ZOJ+EktTuJxn6p3rLj5eS5RnitlxVm+V2FdEDvPmUhlbSk1ks6XLRQ7hqAWYkfiyeVGb
         n6CyE9b20SE6643AI9V/k0PffFSFo6YnUDqKoR8DGk+XaBZn8siTEJRzLjTWvKo6tQZ5
         OzGWaGKXqrZT27EoH4NH68lfSoqkUw+BvdC5195FNugQxTiawn5f90t91qWIePCZ48I/
         TKx9E633YnAGTzFHF2nYWRxmQ9lvFPDTX36mpsiat9qZWH2wUaFfVVIY3OKtI+U7hpUf
         9kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981836; x=1795586636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDIKv15jXy4ubg2ISBeCEutau7CE1wUHQgn3gp+RwHg=;
        b=w3A9bvGf1VRVzH1cbQvWLBoV7h0LyPgS2EN74EuXNXZ3CKWlCN8klpk3ILOg+U9bYO
         ymJw1XE32LjmAD8wA2q8vKt3RlRsOyX6qyOwZ9MeM9hqPS6cORyZvMjAJHQMs7H6cBW1
         lgm37pMePkkEwDrfphBzNYGpUmYkJB9jYw4VdGGKqMr2njBtVK06Xwyh5FElxJbxIoMr
         Wvchqr5gPB2kiS4B8xUuLQft6FNhfL2cGOnEunPh7zXeo1jMTcRGdCM6nJdAvZ1T6pP5
         r7DkRvszH83khkQB60eC383HJWSj/7ubCU3x2QhKNDNV46SXrN4Pe+EhmUanAJx/Hnob
         aeBg==
X-Forwarded-Encrypted: i=1; AL+hErHUypB/uUIQXaSX8Dcn136Ec5X5RPw5E3rabVqeLWVb/1CNI2+45alW5/9ZObaLZc9eg/NN/1U/jGwyPEtW@vger.kernel.org
X-Gm-Message-State: APuU4Z90Dh4IsrskC2eC/iEwMWMiJNe9z1rcOiFeZr8n8Q2frVxGrHF0
	lOiBWWrtCSZOomMxj+HeQMF6bJNFQkffbfyk8ZHa7i1fgWa6HGLinO1/pXpCLCcdbdCcPma60Dg
	EfCjCJt4zWeBgqX7RWRipiJufrIlyWN0vtjqUWqdzOUqJ8C83d7MkZ0sL99o6x/EIYopB
X-Gm-Gg: AZFdTZeRWSopZMeriuzYnVW0kyahGtC3ZUE+umXrSFCfuPs4UgpW+74H9pHUT0c/ghz
	yL0YhRBx2Ldlwhw0uNyCPnRxIXfJFWzwPDZBCXnLB08Any6b521DVbdr9EBjPjQZaoz62fy1/Kc
	GM07aEhBxrdIp0lqjs+34ZEb79qV9f6q4Si3xYoFXOhzfArRzGOJ0HLc107c4geZf3ncyp+FgrD
	LTCW8I442yqGnzr+sUlcHHYsUNZrm85NwL8Pnj7DDVAz9ojPtJI9TDQb3AtqhPIYoQQnQyRt9Gp
	RRwRXuzWruSOJxQNvrVJsO/SAa/P/Pew+NG9+Wt9JbvSw+tj2svmQQXTAzlvyK+Jy30PpPcNmGZ
	jPOpnWgSLm5IfwoxRPvoo2idaKs2quShVVuwyqLwBK1mKn9SoGxZR7yiErUaxusIBlu1wcDYrsw
	==
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345675ad.27.1794981835906;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
X-Received: by 2002:a17:902:ce0c:b0:2ef:e9ab:d011 with SMTP id d9443c01a7336-2eff7518b6fmr16345315ad.27.1794981835507;
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff62e38eesm7288805ad.76.2026.11.17.22.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:03:55 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:32:43 +0530
Subject: [PATCH 12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
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
Message-Id: <20261118-gp_mn_tlmm_support-v1-12-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=SMzXx+vH c=1 sm=1 tr=0 ts=6afd3fcc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lqpqssICSlazahQHq3gA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qIYtvgW7OXAcULcAr6f78DsVBanUhRs6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX1xr46eu6MU4y
 RRHnN15xHZcuvEy9JmIKJR204mNvThRhWYvdMhZDGRqA2jFUko63AfcCs6NtoZYWyaU1S/mwSZo
 OV9nbn5oJl3LTEOZkfoZvNuV1UbTNU8fioEcK/7KyJKnI0kwi65ftFu6e8f2ZxVpz6px8Mc06gr
 puuxipSEhzAE3rP6goFmFHDOFnwVSnCA2+ozagAZchb6Tcr+IbPNy/Op0diA+Iown6kTdt3WRDM
 ucPEbCjCamiNW8x7CeOdLEXlQsI1b5veBQ8wgxcvrwlgPQtUFN6TY46WSL+uKwf83BPUqMERzPq
 oRo6YLsUH5PFxkYouyqDCGr0cOq/A81ZZej7GEYXk0+jc5KVX/XHSMg2OHZyjcdNoJ6CzBm9smG
 Xu8dbV4cuRDVpmNiGYJNRJpa+XAKB2dh4eKPCYQcPQSQiz0O35LiquUUP3GWe+Lwhjh5bHAOH1g
 2zhbnEbOtys57U5ZUkg==
X-Proofpoint-ORIG-GUID: qIYtvgW7OXAcULcAr6f78DsVBanUhRs6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAyMyBTYWx0ZWRfX59mM7qXxLCa+
 e3ATSOLIDXZlmdGSWoxw70CZnYynm8dhROlnr1m+rJOvu2cpyFflS6ms3i7M/DEXXaGQjEBAm06
 QVnJasf/3aL/B5JQR+8pfYIMTSaCSNs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180023

Add the gp_mn pin mux function on gpio53 of Kaanapali. This exposes the
GP M/N divider clock output on the dedicated GPIO pin.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-kaanapali.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-kaanapali.c b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
index e9351e29d38ed90b093d6a23572805a5a41a950d..2c27eb2255c30777310e6280f6767b426b12fc79 100644
--- a/drivers/pinctrl/qcom/pinctrl-kaanapali.c
+++ b/drivers/pinctrl/qcom/pinctrl-kaanapali.c
@@ -588,6 +588,7 @@ enum kaanapali_functions {
 	msm_mux_gcc_gp3,
 	msm_mux_gnss_adc0,
 	msm_mux_gnss_adc1,
+	msm_mux_gp_mn,
 	msm_mux_i2chub0_se0,
 	msm_mux_i2chub0_se1,
 	msm_mux_i2chub0_se2,
@@ -890,6 +891,10 @@ static const char *const gnss_adc1_groups[] = {
 	"gpio42", "gpio77",
 };
 
+static const char *const gp_mn_groups[] = {
+	"gpio53",
+};
+
 static const char *const i2chub0_se0_groups[] = {
 	"gpio66", "gpio67",
 };
@@ -1380,6 +1385,7 @@ static const struct pinfunction kaanapali_functions[] = {
 	MSM_PIN_FUNCTION(gcc_gp3),
 	MSM_PIN_FUNCTION(gnss_adc0),
 	MSM_PIN_FUNCTION(gnss_adc1),
+	MSM_PIN_FUNCTION(gp_mn),
 	MSM_PIN_FUNCTION(i2chub0_se0),
 	MSM_PIN_FUNCTION(i2chub0_se1),
 	MSM_PIN_FUNCTION(i2chub0_se2),
@@ -1555,7 +1561,7 @@ static const struct msm_pingroup kaanapali_groups[] = {
 	[50] = PINGROUP(50, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[51] = PINGROUP(51, qup4_se0, _, _, _, _, _, _, _, _, _, egpio),
 	[52] = PINGROUP(52, qup1_se5, ddr_pxi2, _, _, _, _, _, _, _, _, _),
-	[53] = PINGROUP(53, qup1_se5, _, ddr_pxi3, _, _, _, _, _, _, _, _),
+	[53] = PINGROUP(53, qup1_se5, gp_mn, ddr_pxi3, _, _, _, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se5, uim1_data, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[55] = PINGROUP(55, qup1_se5, uim1_clk, ddr_pxi0, _, _, _, _, _, _, _, _),
 	[56] = PINGROUP(56, qup1_se6, uim1_reset, _, _, _, _, _, _, _, _, _),

-- 
2.34.1

