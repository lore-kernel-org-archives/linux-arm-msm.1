Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792576395;
	b=KgXTt30KesiJA0WLyBTXQLaXfOcLj6WcGyBQYkap+PcQUwtnqDd75/ShSDibcbbFm3YV
	 AaJl36ll6GTZBnV341b7hv5e85xfb1XYuEZW6qRXyQQadLmCFkO74z1kwRU0LTs6G/q/M
	 cjo3C+BiG5Ssw24sLWpqZXibULs0xj7YbU8nlUHIArfLn0H57ly4Q1O7rAWbR62DCGQn3
	 UU0479hwF/wDXLvtvtEZEfuh6ESZ1C+3zmgZ2VyWDiLEaxqH+/dii8PnSrdVFDc2/X/k4
	 VRhzvBBtcChc/ReenUpT4a3d45wBScp9VaCW0KEJPAf5xL3Uo9nYa/wi1r5a6m+TNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792576395;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
	b=n4t1OSUHxlQvLOj6ZgFJuA/WTzJuCP1aSaYW5F76gZ023VaQLWJkD9A9GeI3HVVWVvaT
	 M+oY61DFF/sDuiVZV3O5NKWaiNnCQh//F4EDfJ6lJaWC6APhgnBXEwdnef+RsBRXxhCpX
	 FpRWDfPeMPld2pbyuKqoBotxO7cE01v2on3P5hnJZaf0VHgYvvxneP5l8MSihx2EIcZK0
	 Sdvps48+4vk4seAVE0guM3dZ5oIxvBSp+X6FaA5X7hohpv16NPOGCyiUYoskExZ7k7p/d
	 +WwkvVd4OFS9+hPpwkx3PjjnSDlRF93nm7SudZfyowP3HC8VQb33BrA2wNrgpIi81xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPr4pjhQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw34eXGY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6C606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F6C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pPr4pjhQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Cw34eXGY
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L9Kt37179323
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=; b=pPr4pjhQYBxV1zbN
	Io+tfTY3aIU4h+rNUlm2Bgb+i20Xtk27am3eRWVDXyZ2KGopsRK/aQnEWROox1W3
	eh1hbEnIdwO5HQBOp2IQFeoj1+PpTMNJh1sw246qsUoz6k8mT8pS8OUpOXrTmy5V
	dJFG9dXjULkrBCfruRXzPxpoQ8qm34I+lcVZ1sl4AUiWlxso8J7oBYBdvDvjNl3q
	6kEpL8WngQxbdbTPpurbURVglZ1G9vh1vOfUka4W0Xd22KkXZQjt/3ZqWjTkkycZ
	dGnjfKy/BAGoLGlRtexIz0gPJfLppo1TCx0s9zBbGhjzosqFS+8JpdLLguVRbhNy
	SgezXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r2egd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:53:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so15948885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792576393; x=1793181193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
        b=Cw34eXGY17ZiDWmbUU0yZZBBMmN84P2t40AknRo5FL6giuAPpWN3PYI8YoL+LN1aHP
         7MD4OEx6BNIz+L/PEvue4n0LhlZ/+ud3Lzknukl0Gnrb8EPu0LiMFCGFd+K/ojLBmRoy
         ZdN+TFGUHs8L63wS9T/rYlzpzWCj8Yu9+IdRyUhRqvflZBPiuXzYuPw6BQFpWZcajSsr
         eGHjoL+rg+jGTJ6oqJ7+H9gROu/BSZye0T+GMiIFfl9ewcgwr+DWANhOyarhjfiF86c3
         OCpjE+C3Z3F1bDkQtsvCLhhmXG7lgx6nKzI2YyWnqN/7cXeW2riW2LaEEMU8P0QKpMe8
         jILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792576393; x=1793181193;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IcAOJtu2GeH5NVoG/ptuKUpX9Xs6ODaL48XYm6Cio7U=;
        b=Y7fPh0EdPWmqpm133/gf2jF30gBsNPbSk309rj4nrcv8zZTFhwVqiaY0clpf/5HUX6
         J+08JGn95ZBVHzc88yvu6gEIP9hXHUdf4AqwWbSwT3Upe2vnjVbi9XD0NcOMboC51Y5n
         kymWaWgPLyGRuHGihE/hOsCvQnw8uCFNP1EMG/HX/ivY6aIv3SX6Ub8NGuNXqN8gBMlw
         W9unh0pZDxkRynH6o7kIaoKOrUfmxgWKFbv7/NsTe9+KE+oGiEOuXPndyEpZRF7X9kVf
         UYj+Mxyb42PjXRQMrYHCCelLjLea3xS0FhY1UUZshPD8r6YrqfADZUEOnefNi9HNPE39
         FWOA==
X-Gm-Message-State: AFq9FYKzG2RL5xGkqpHF8pAV4VoenD83JYmnZS5xfyTWxb+1SadO6C5X
	b2P2Yj0QJx9wa1Wf1N3eXNNBLkU7Cc9B6estR+/iMhv5hl42tAJt+ya4J3f9yWx9yqVLIY9b9R0
	uYi8IhdUFOLNbIbWi4EvtM5tdooRcDt3cx1ynaMD1XKzgQLc9Q6GjYBl4GMUFKYYM7gPx
X-Gm-Gg: AYBFou1SVj8Nbf0TkuTT4Aei6iph2xPFcDzosHlAgRWN7awNYCG5xmaKFP/8GL/8Wgf
	GLhYz0tAr5zBK9Hi468BWcxAYXKpfA5JLIqwSQwjZDzgfL2/4WF3UAld5r3Qvr3PdF9M2l6lY8y
	DSMS4JRzElOZzH0giScWTeubjDEmr3452wG7yVyc0K+iUb4oBL3+3SgNnlihFkjzqbG9Ana4SP8
	dYESZpnNmsR/lWgfVg586ZiqMSF9ducoN7uj5IFhcw2Z3BeM3/UMRmJG5RW7OMI2cwwrrCIgmmj
	LeVFUGCZAvkzgv+u9DCbKT+jD3Xbl78SsosXjiQ/fBJarxcxPELa7up+ITRjqdFwRarLtTHL98P
	MHV+iQVjvVTx5SuTBWcvSFA==
X-Received: by 2002:a05:622a:1343:b0:534:f411:a5ab with SMTP id d75a77b69052e-5369b7db1a1mr26406841cf.4.1792576392983;
        Wed, 21 Oct 2026 02:53:12 -0700 (PDT)
X-Received: by 2002:a05:622a:1343:b0:534:f411:a5ab with SMTP id d75a77b69052e-5369b7db1a1mr26406641cf.4.1792576392508;
        Wed, 21 Oct 2026 02:53:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f783e8sm58910966b.13.2026.10.21.02.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:53:11 -0700 (PDT)
Message-ID: <c8911f7e-851a-4083-b166-ac2358ce081f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:53:09 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] phy: qcom: qmp-combo: hold a runtime PM reference
 in the typec callbacks
To: Oleg Keri <okerixx@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260916133814.3977-1-okerixx@gmail.com>
 <20260916133814.3977-2-okerixx@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260916133814.3977-2-okerixx@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad88b89 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=k-ca5NtP-HZlscmxgwYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: b3lnWgvL-cnhPdlf4gcm7ITrDlGw1gqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfXys/vacHLVb3N
 f+WoOH4zWnWGgUGsGxBkJmg8Umq/2pGR6WqSTS4an2C4g7w854jSbWGKrPCVQI8jWma3O7GS8gy
 LSeE5SSVdrj5AUMvWAd/l3vnmru0m7cOdCX61WM8o9iqoLQOxRf7MoEsC4TkDImf0fwgQoJ+Ssb
 vehV/Te6gnuO3GRTWaYc77ZTGf0bnP/qGkUbUw20N/A0NBNYo3u8GsOByR6AE/i8kP0zetJzXHi
 25el8oLathiumkzrrmoi9UkVzSOg8g8ZUstwgxYmfbL8TFHcbek9Z27B/Zi8Moj3Vnzq+5Jkh0q
 Q42s4KuwfpRlynYwv+TvKHKwFt/uEKLs2AC3tVuKbNt7v6KtVHSm3ZVNwzYcqkP00/yXr15V27d
 URf0XsQlr+auvGMM2COBH+DKktF8ccGES6YNr8RGTG2Z2pFeNha3WV1+kCDuY1N/kD9Cjw7cXdr
 9iquicy2sJED9aNPG4Q==
X-Proofpoint-GUID: b3lnWgvL-cnhPdlf4gcm7ITrDlGw1gqv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX13JXVlntzf6L
 uQYDVBGDEUY6Iy6ER4Rnn4OalWDZfhgtFfJPakrX61iQ9TEgR7mVZl+0YLeBt3UBn2duCnzgZ/T
 5vADG2YSigwxmXRi+KvTs1ZDGq3bJS0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210039

On 9/16/26 3:38 PM, Oleg Keri wrote:
> qmp_combo_typec_switch_set() and qmp_combo_typec_mux_set() tear the common
> block down and bring it straight back up, calling qmp_combo_com_exit() and
> qmp_combo_com_init() with force=true.  Both release and re-acquire the PHY
> clocks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
