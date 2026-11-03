Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699915;
	b=sXZis4+Koia3OSWx/h3OwSjH5fmcvU29XbKBj0FNcD52kXi57FjL5GlLvHqLM0g6ktWS
	 LDwGfBQc5okIWSX7u6VvsXOyVkrkgC528SgQCJjpHW0I8hxZyWl/ac3VkjwMJW+VDPSyn
	 FjM7qOwzJmkOge3rnrun+ndWMU4ZWc5xR7cX98+g7W0pP7z0kL52V9V5cdgBGikj+fkXh
	 489O0Nr1gAs03+eNdbtTCL7v8mfF2O2c54GwYSVjHW8ZF4uUt9IUg1Xo0Ggut2XMNvRHn
	 CBXP+PUFQ2PYwyRlDIkbhcXlSsZn2m8P1np68lU9/HcNCn2BFsCbhoC8p4bvOP5RkrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
	b=bYFva6gEQcA02Mlqbtt8lqB6/YgbzS1pvd/xTylwr0iuD1D4O/Myn5AtKTablkSECyqZ
	 sdvirSYDJyGs1RYUJW/ywOopKUA58NiC1HZ29CZpLkOhKNjPKOmx/Vghliyqpp4GDWO9s
	 0kEKlUaOTt7wqcnj57JoRG4aiMwkT78dYdx8AxyIDUbLJYxw36e7braK1JfzFV8dB/iNy
	 OFSMRmKLUY/632L8h22UPFyiMPffesuYc+Kc/NSM9mWBHDLSuiwhegkd/J8lr190b1Rpb
	 ikOHmSJXUijkFhVvWOqY1/4oL4m1Uvp/LgDlGYFbmG50ifcuzPArJZhE3gVGpZmSuhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URR+HC7V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hl28eZFc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7973606EE90
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 09:58:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7973606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=URR+HC7V;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hl28eZFc
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A389a9A4002666
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 09:58:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h8VbAAq/OiCxzdza5wuB7U2i
	MKbdYZdGtWxp29XUI/s=; b=URR+HC7VSNmr26BD7sbjCXSM8m3Rs0mYiDc87PwZ
	FLwxM/2wDX7Gnbg7TdfqPYR41ymgU4Oq6J7/ehMsKuO/gvXjYuiU5POIktxva4aB
	3QK9UMWQ3Nxjia/YMog5YRWQHg7nyrepV+dbEr6BCxyk1j9trKDUL912mfw2D/58
	+YRYHsJBu8O8u98AeofTzeollGSOnG/YHBh4CHp2UKlO2WdHPcQ+9iIfkrgOAGPn
	8EGfyLTx6tAYuhzKSQPKeSGbBEew7HYJcu6le7wfgKX61uO3AtgYaDyqD72sAbXA
	JaQjtNmLQyVPnVvZ0fvpUS3grPXu302A06K7VpD0qkXsYw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek4u7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 09:58:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91ca3cd6071so91389426d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 01:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699912; x=1794304712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
        b=hl28eZFcuPSRlgV/FsIEqnQR9Tpv9G7u0t0C+3HbRuND5UpFQzpbPQMItEI8aTktA4
         RTBVP2e3ONUyuI+8L2+BoziIqoedeMwOKohoXF5rbAMMJzxYvk98w+vsxFIg+LBr21jx
         x51FKY+sGc4SZ3JNcLGlICxESfi4dXly1NkyK9ewaQwkaZ3kJVG1pewtXPonk02+ZN7g
         33TDX7GQTudvha9gyPyudWPd5zMHdem2tR4KWOtWb/tVPKPDEqxwM1l1AkJuzX8ZQ0dU
         7OO/JWDJv3ms8CEX0J9gQTl3ATOREF7+u91e50iXdvPrYecklqJeSkA/qYRvBKx/ofIL
         I6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699912; x=1794304712;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h8VbAAq/OiCxzdza5wuB7U2iMKbdYZdGtWxp29XUI/s=;
        b=CTF90+RBt+w1hUyyuPdDXWCKDEBWy0auaJfgVQkN3HCybSfVuJiGK/aOsGlM02dMcw
         8pzaP1lhZpduapCDrFWAP2w4SuFfqj3s6ABYpQtlFmtW4OpQVxa1OWrhuxCvZfO3YaFX
         QCThlc1GZW7fvvg8oSjFRC7DzGpuVR9fXjSY6OoG+Vd9laYVImcAhyihE6PIpHH0y6Y2
         D9M8r4D7gvWYj0BHA/D9V1XInUX+2acEHOt7cg1pKv0fhH5j8WPry+dNJAFqrsLoXZdW
         /bs7oUqsYKrfXhFtsiDFmYnFIpIf+P/pVqD0drPLSeDGyw/SNKoWcKvyrWHUuCVI5V4d
         CP2Q==
X-Forwarded-Encrypted: i=1; AKwUvByYGgFMwx+86zcpoRPv4lugx2XC3Vo9baHjVNbXJPPEnH1T272oHcxDeEGVKtUvaGDccJGyfGZ1xA10KH8G@vger.kernel.org
X-Gm-Message-State: APuU4Z/0HrFhYqiuMg2yySA9bewUCVHeaZ/kX7LcXgpBzY+MVMav0agD
	lZicQd/q9BkI/XtyTHfoKznd/yX8PgpVk/ulGTJxVfbOHj8YKETJ85+OvI4A9akhGGDB8HpoxlM
	3WZDtCzZ+gjEM99z8BC7ZYz2g50mDnz0/yAE6cB/E6MUaVJ9lMljSQwyw6RsDi504wk9h
X-Gm-Gg: AYBFou2fBVMRBjKQXnpJK3bp5b823COJWiMofl0Orji/APrFO9z3X0a3P1CCdYLpocW
	S+Cn/HTY65x47WQFeFgy92V9RO8pZpzHtueGzg+vjdGIFvaPEDuRYhbZg4mIqHXH+tJ5SczRvmJ
	QTETmpKzYcfmzd1fnoqu3Nl2AAPP7cLezQkDTyuoEzgnEdUL2i7UMtEX6XsoP4JWL7VgOGF9yWy
	H8S4wLN8680XkhE2k6BjR4XJ0JRAYxKBfaKIWEmHZJ2Ka7/pS6Zc6sWiwXlY2QvKXj9p4O7VL1M
	+fqfC1ZtRJzfgJKkzkSNjMbS6E/YlUXez6p5qhdYThcC5mvl7OXXHoHlUuaYAggcqHkN/ZgPnp2
	g6dQEjhKAbO+76ELbpHbI9AsxBAH/AnLRO9OExECdGWxaFmRnvTWPwX7c+cTqhe8=
X-Received: by 2002:a05:620a:2b43:b0:93d:92a9:1a5e with SMTP id af79cd13be357-94421799683mr2160884785a.37.1793699912396;
        Tue, 03 Nov 2026 01:58:32 -0800 (PST)
X-Received: by 2002:a05:620a:2b43:b0:93d:92a9:1a5e with SMTP id af79cd13be357-94421799683mr2160881885a.37.1793699911805;
        Tue, 03 Nov 2026 01:58:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm69051855e9.2.2026.11.03.01.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:58:31 -0800 (PST)
Date: Tue, 3 Nov 2026 11:58:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] phy: qcom: qmp-combo: Update SC8280XP USB3 PCS
 settings
Message-ID: <6ri5rp62hyh4iwhtlcjycjnjz4zfcvzt6rort3c2443azr5slc@ka7uyggocbei>
References: <20261102-topic-usb3_sequence-v1-0-5b144f5e6865@oss.qualcomm.com>
 <20261102-topic-usb3_sequence-v1-2-5b144f5e6865@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-topic-usb3_sequence-v1-2-5b144f5e6865@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX5+pol9goltqK
 8At6OQYHMnCdQRHa4L3HppZw1PoYSMRBY0br9dHhVb7eeGius2IWhit+lHwbsmvZoQeRhWvXgmm
 XGNlyjktjIJAanXiI4KUpK6LnuodIMp9aApSRgb3sHnq8NTtMjZlOezB9WFp+HqALz6yJJ2GO31
 n6zDZG/2F5uEEe+8erVBCTiMFzkMy5Vi5Q1aZqYCAsb1j01hgNFL14nR3Nnof6NUPCwj39y9xYc
 4RMj5KxNe1K6u859dAgBAyp6degyEperZD0ImmNu886MiIPt8PN2bKIluZTEJfh2DonjteLED/O
 lIbTJPQGPeO/Ezjx2LHqkkrxFgtTU5O0TkJFembeadDS5rUWelpPtzXFA0mnnoa0OmBKeDiD7r6
 +z4NBXIjO41ROkctFrbjoCT6imxLXOp2usYqkQMUpLjfesP9Fn1kAKBYdVy32u+kpqvkOLLH/O+
 55pkqL+sDLzE5lLA1vg==
X-Proofpoint-ORIG-GUID: 67o_lYLNKyN7hvXMcioCTt38Wg90uYZi
X-Proofpoint-GUID: 67o_lYLNKyN7hvXMcioCTt38Wg90uYZi
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9b049 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=T_UvXWJlDOeQdzyIPjUA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfXy6JFy7IsXxyf
 BQC8srO75xbQQ+fUC4S3NZ5weIiqeRlNc84vSzkFvqXbEHfspZnfwnfg2QuqHwKBc6wKNVkXKM/
 3teJcV8axouFU8Bvn22CgG4nqHRUpeU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-02 14:58:37, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Update the settings to match the latest hardware reference guide.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
