Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686ED41DDF2
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784888373; cv=none; b=YEhfGSO04zZGSM5eJR6mpIWhiDSfX1cGmJu/e4/Jj6KBM8V/N6sSHjbF79qG6mpJlhkxN3NQfBKNPIuasuAMo66qYGbdyuIRRBRyvXmvyAnaekQvOE2+cXSWaskJ5avCbyN/ZaOQJNjUHvHhW90tjSTy/Cz3BxOYRT1ayTWQW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784888373; c=relaxed/simple;
	bh=Nns+/5SBxPi2A84H5ttqcblp4FlRDsTFOKxc57iGwVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z63cRFYvnGDcNy3rUNBLxqLrjmIGvyXi4BWZE81rhmpxqa+cs7vI9jDoamPtUDMYw0j3/KB6tbY0PUF6iWg6BcN7hybu4i1AINgalcaCKd5jpgXRIyDaEwgWp3GpvhBwKOAwzPdXzk8bW8XRNkMXwbYHApW9lYSHmJ7sL1Qwdx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M1MJKeik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDKjHiKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M1MJKeik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDKjHiKi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADwtn2889386
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TzcThpzQ37KI9SS49pQBG6i2WjGuZuWj1VXCZ/oPMRw=; b=M1MJKeikrGQ75vy3
	vJ16rtMvbgKDP3QJ5DTVRlDwcURzvKxQ4DxKVRuE5eeW8p2rOAc7KlRUYyvCKgK0
	LFo+3m+xeQ1Ma7rioBim3MWcbAtYcxTelZmNikSrpVhGHwamf1n2tf+t5u9iHIcK
	Wqu+FStM8JuGn+FbSQ+GxWyey6XfcEYNUE6IBL4KSFqqN0eYoVwZcAf14pERJWu+
	ZEYWddCk+fbhHO+HTTrnLMURidFKtA0le/1VYhejMV3Cln0EmPJbhwz27O3gQlTx
	faABTNB+6Y6g67HcEeJxCMg/hCeoplPEDdTevM0RgNW49kmLv5m7UK1eJcdlochN
	an0EcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm61kg1aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:19:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso409880a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784888371; x=1785493171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TzcThpzQ37KI9SS49pQBG6i2WjGuZuWj1VXCZ/oPMRw=;
        b=TDKjHiKitvSLQQHgNWzQgKgVy+GxQkBG5QXBIMEPtJdwMalhOlpkry8B+Z/ocsZdxc
         YamcYzVAfSvz4MueMKFAZ7NosAo8RNYXqafl2SH+adBx2XmS96oJg6d2kQFEB3gQAr8S
         p47gFq0mAvbq3fLwmmc6DqT15V3vSE4YlSgSBZR8MTRlT9YoUIvdCROqo/8isp1SsFlg
         qh1Jg4sOJkgw+UGAMNybEJKSu4q7qdfD9JFsioJD0z3AdpT/D7VPKDlOvmWwV+hpfMrp
         oQG860UWqNwq+omTgnJzVg5LUuJKS64heUQ2rFDEmWSf+dimD+czY6pcZMLuvgTxFYoM
         9atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784888371; x=1785493171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TzcThpzQ37KI9SS49pQBG6i2WjGuZuWj1VXCZ/oPMRw=;
        b=kOg01c9pwN112ntVpJI36kUNtBc8Y4yXYT//8tdbYpgWLZHbqJRJnp7st3+R0VwmH3
         A4li3aNYews+PKbu8Z3vpVLgrjjZzhro6EQDy4nhe+TiA/7vM0mytq2Xe6IGE2KEyVEa
         Bb8BCI2JNfegoRK6IZYKrq1MAHskdDhzad7ifo9ymdiim0bq8YEfq2emkCkq72pjT+ci
         /LY1s/AvWOoAU61TMcHcipZdP59gEctfkthUGyCVKQ7OmutDQ1GHJXOh+KPu+RpIqOmv
         JtjNi2Td0GLc4QfYkmal2WuTUOAROheQQMJk8KZtP3ZE4dq6QLYz6YJ35d+z+wXe3d+Q
         kaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWX9e0LpSAnzVFVvLQLDr9CQe/VD9ODG3Lc6wQtxIjmUjZkNl2b5CcgrrT7L2CTcXOo7RqducXpX7RpnSt@vger.kernel.org
X-Gm-Message-State: AOJu0YyX7NFdQ7kK7UIVGikqB1CCxaSFV3L3SPhWsPHX0SgE6EigEVbe
	dOU9buymu+OksmQYwXOjJ3j5RjSMSFR3z0mcZBnBcQ6lWVbWRDPb0v/IK1QbcGKsgXmSBERG5+e
	E4kJ4z82JxJXQzJAxpAZ/fqnuwuEmlkH9O8UKnH4ezYxQkx0dP67afOZD0HUaSdSg4+gp
X-Gm-Gg: AR+sD12g5ulhNVKAxdg1QNjnf1o2ZRryfCG1iR5QHLnIUvaVRSdO1ukO69ZMf04/rOj
	0s0ruPzDfwuhrxL2RYO/O7cpvwS4pCQ40Nzr6zzKSDacviwXJV8tPvo2poI9BRd6lFhdAw2qh4K
	CptLF3kdMYCplMbdXvGuN2tItL91sMdN9amD0YSphWklXHXEKShXLofL768QOgr/+bi23xStmwc
	qCpPXW29QB8tjc0eHuXPwX5WgtNf5sQi9GPoSNWN967YoPZZUhCF5kLIpitMZNGQrm8PQexbYsf
	c+QdpdfbO/qw7MPxLlVj+ElZC08CIyU3Qos9lAztDF9cWPr7F3qTPhTBu6Wmg1F3h2h+B7sRtqi
	ER6X5+a+sx5C32GDzdlF9VdObX1Ty
X-Received: by 2002:a05:6a00:4194:b0:848:7475:29bd with SMTP id d2e1a72fcca58-84e2b7fa657mr7632804b3a.7.1784888371004;
        Fri, 24 Jul 2026 03:19:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:4194:b0:848:7475:29bd with SMTP id d2e1a72fcca58-84e2b7fa657mr7632780b3a.7.1784888370614;
        Fri, 24 Jul 2026 03:19:30 -0700 (PDT)
Received: from [10.217.217.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17236c6fsm4554751b3a.5.2026.07.24.03.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 03:19:30 -0700 (PDT)
Message-ID: <e2063dbf-f899-4f74-9eda-386a58fce23e@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 15:49:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] clk: qcom: Add Nord display clock controller
 support
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
 <20260721-nords_mm_v1-v2-4-17e5a445a512@oss.qualcomm.com>
 <178470914171.3016846.549735580156854018.b4-review@b4>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <178470914171.3016846.549735580156854018.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2rf-GKOagOGduwby-awoKcCCI15-Ncxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX/aE++/HcngEX
 AcPYW7hPfQngBYtdwVhSpSd9Ku5qWREnwgEaQl0LauuBWo3QgBcBoVNGt1r0A8oVm3aR+ShfMvQ
 yU4D40VOib6GFVN1GWos7l00dIsEky3NhKP2Fb6rmVjCR1kclX6JnsgmnjI/a0+J9tfF7nu/b+j
 acL4/fZ0k+N/C5uiTnPU2tqcq6VHsfzKmAqMhjEpyZEHL8pNJvRKFxhQTLafMPsT5HNCteBqedW
 IgAKgJYtjzYPgobq2/CylbCx533ZgNfiZI6k00R5z1uijmeT1ua0Fo1K8I/DqOk6Kub2Bcoiw0b
 7DW+NIHN5uUflc685v6dcFYgnHLPCx5yhyt9dufQLQ5h3cqB1xAW8AaH/CNwbCdYglDyVu06Xsq
 6FDqy447aGCCdCrinl7NA/CZd00x6wqxFZmMGhuODs6oaVInUHxg8DCvD+vAcHR6CHggXNgDE8X
 wPasgdgt70MWDDV3xYQ==
X-Proofpoint-ORIG-GUID: 2rf-GKOagOGduwby-awoKcCCI15-Ncxt
X-Authority-Analysis: v=2.4 cv=JLcLdcKb c=1 sm=1 tr=0 ts=6a633c33 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=5U75EOjajMfvmKnCyHUA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MyBTYWx0ZWRfX8J7FlD8U7W0I
 A1mCukq7EL730b0V0GAyHFx3OdcBQsWgs6Ig59CM5Jn1QZLrgSveYwn3gCWjHO2x8mNh14O0NxI
 5qdTHRBKJyB6xnoaAP1iOwOqYeu+JRE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240093



On 7/22/2026 2:02 PM, Alexandre Mergnat wrote:
>> +
>> +static const u32 disp_cc_0_nord_critical_cbcrs[] = {
>> +	0xc00c, /* MDSS_DISP_CC_AHB_CLK */
>> +	0xc008, /* MDSS_DISP_CC_VSYNC_CLK */
> These two comments look mislabeled: offsets 0xc00c/0xc008 are the RSCC AHB/VSYNC
> clocks (cf. disp_cc_mdss_rscc_ahb_clk @0xc00c and disp_cc_mdss_rscc_vsync_clk @0xc008
> in dispcc-sm8550.c / dispcc-milos.c), whereas the plain AHB/VSYNC branches in this
> file are at 0x80c0 / 0x8030. dispcc1-nord.c labels these same offsets as RSCC.
> Can you double check and update them to MDSS_DISP_CC_RSCC_AHB_CLK and
> MDSS_DISP_CC_RSCC_VSYNC_CLK ?
> The offsets looks correct, only the comments differ.

Yes, Alexandra the comments are mislabeled. I will fix in the next patch.

-- 
Thanks,
Taniya Das

