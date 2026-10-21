Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792584289;
	b=TlWmaLZFlvcWL/f7cwyNLPytvQxu+R3gcJYOaB8NtnD63rZ3dHRczGBBDy+xEXc6c7Hv
	 C5bdnY3mHCXlAT4iY3f1YPx/jc5fqo39DwK1asi4NFOa8yWhHNMS/2M5s6xSqjh+Td8PZ
	 B9NNuVx6FG101OdKvdV4yzEPoAuIXuV3hF1WxwotqdJwHFuEiwZV5PHHaA9XAphJ5f6iI
	 r7/pei0E04vGbGTp//ky9LWy4O47mJMJ3dnNnHkoGP3R/0LcNnFBfgekMTl5sLGg4jJlE
	 62tvvBpF6Fo5c7dshv60oE0cnmT21ElZUIxibjOWD0q+LR2esuGxGX+2wTSi6BLTHJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792584289;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
	b=sRFDduid6Sl//PN00x3RobflQ65HrW8fMWfJB+GImwdL5W1T96wpjJXv9yb2pw64sZxX
	 Ww1Kub4p6sD08ruia8wS6s3xq9nzE695XAj1SFXMv8rYvg7T9kLYUt0MChb60kdr7hObn
	 H6lmemxawQLn/pjrLnI8L2V+24nNeptEqQh68HVz5GdO3KWC+J0t/YkXNXGsiC/h8yoik
	 HUoeFGgJt1h/SMseoB4/CQxDBPb9PcNk2VvAbPI2/AYxFRvgpggkG2FCWtTUdWCnaRGkP
	 2CqeYdkS87VZXkUdKD55aXw6NsYjZtaSBgyY9+aTcCGsZbkcmxzS4tLYQEhZ91nVbQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Qjc4a8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7642C606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7642C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+cERM6H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M5Qjc4a8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg7rj544091
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lVnw2USx2TyzNv+Sffbcxp/B
	IiUfguSBZbsmuhMg8fY=; b=U+cERM6Hs7kMYYj8l8dw1V3O4BY5C+TYCPX6f1hY
	X9lgC1EeLQazoPLr2w2ihUiLPTciOw0kaXObHyNrclw2NDtNfvJ/03p04DsOqmK1
	DnnGJDu/KuTAvYG/+VvwDSEvkztpXs7awKI6kzSwU7arHuxAwSd2J7oPntrYiZTD
	vq4tXzZrqrdPXOmlYTmksaKmLlKwHydNMKvJaVUFs7NC5XPuWZMgEMNk8X0BZB9s
	TbJXgimEDbqV5lL/k+9vgrnwnvGeYOWnoOFhfnMa/qlEzKze+z+/oD+Q/V33WNMD
	2LKcytcOJOi9BDbsQQ4FNrNNiGff1WhWi1DzUg6DG2axTw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj48kbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:04:48 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e8be2221eso94156241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792584288; x=1793189088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=M5Qjc4a8UG51DaMRFb5V9VoztEffd8h86i6+HQ3Zfo8pG2a4gA64gN2BeQ1lGJoKMo
         zyRVBxCQ1tlcOC8XLxHuFhYcwoeXjA1dw4QWezOA4+P18CmU8MlxOTsDIiHtPa8C8AKs
         AllNqs3m0TbPTAe/Y0eh7D4h0him72apCtsRuZuMvruBT++8XjZQyryJHe86Yem+Yw2G
         odlYzE/H+Iao4jWCNgaVDeFJU064EhhvUthj8lWWDg14O1wIudt1gHO0Q0TJqy3x8dFf
         oR6SVFfd28VPaVh36Fa2o8Z4mdCfv0bN6EjFBjOrXsB3WTukdlLpRjZTpGkZ51515/no
         EEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792584288; x=1793189088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lVnw2USx2TyzNv+Sffbcxp/BIiUfguSBZbsmuhMg8fY=;
        b=KsErzpraGVvj5v/GLDYtaUWzxH8qjypduArWj/W8ge8rTMBEyb7+IrTLBL2ezqeR33
         N2rZylRrYxbY3n/G8PyMlGWQkpsftnIG+bpsl17pNk2Z1VOzxsorcO1nNynwZ384lvnB
         5kFNCZ5741/7Lq4wxH1xypjz9P1bRFOJm80yLQqDrm+ZL6tObepBJAYn9dWPSloV4fTL
         ARld2l/E05NXZGvVHiwKGpAd5Bga1RXHpLhygoD3FrYs2TzZEmdcJosU38xDjAGyySN+
         YGHiJZuuYUDJ3svDRL9jUkHZzI4505q1iXXPTYHOF8onegYI1N9PAOYsRVpns9/9bp7V
         g8bA==
X-Forwarded-Encrypted: i=1; AKwUvBznfLGMSWYx5WF9/adyb7ohZb+vfxV/94Hte2jwnBvW+pz62Ay8PQDhI/ff/WcVfAo4qRYsm2DcvL0M8vTo@vger.kernel.org
X-Gm-Message-State: AFq9FYKUTxhngZzjbD90bOKchLM1UGE2BOXcq737IvGRP68vVYmXiWy9
	1AsYmiGNxnNly+M5pfy6LA/Z5CZvFag7sP+TgYyNaAKtiVc7YPd9gwFuNGI9wRy8+x1C7z5mgRl
	aoBnBVoGKXoQMakAm6GiU7rRJm+CKQf3Kp6VikVV8A33HAOY+Ny3ZEkFczXPqsHraZ8cT
X-Gm-Gg: AYBFou339RTZW+KD+hGEhDu+rWITdN4GCRCjxiMKMffveTUjwYWvoyTmjNtJZ3HMyEh
	uMQifng7LdcZyPu5//MwibeeviUigIP/LXh8+cIdPTYpJ+cENfUHK4hhhplOrfeEyckpKQ3GwQr
	tMgazqNipL0pCqOopHE2wISiDY7mhOfBNi7IqTtjYctB4DV+oVUwiZRZvBN4UqV+Hspehf8RcU2
	PSLeG/HmTacXBKsUJnUj5Uih2jSohEvfhX42sQcFhIa/ynGQplM/FPLT6bMwYwZyG3Y2ct4J1fP
	vyzfiI3h4YKedWn0WyLTaWEFYRvWxmxQrVzVSHaB+TY6vnEZufpYSaP+WnJfc6P5zCE0kUYUOvG
	ybzPg5fP6NesBu2YC
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559568137.11.1792584287674;
        Wed, 21 Oct 2026 05:04:47 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7cc925e0fecmr559538137.11.1792584286653;
        Wed, 21 Oct 2026 05:04:46 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm44223715e9.3.2026.10.21.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:04:45 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:04:44 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hawi: Add memory-region for audio PD
Message-ID: <yzgojjbovtrbbz3lomoe5qiooh4e6f5dtrjpogvoj2kv6cjm5l@jdvh5nq6fupz>
References: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
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
In-Reply-To: <20261021-hawi-rh-v1-1-401143c22401@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: g7WtcL1dcGwEVgpbLrihecz6GeaRCQgj
X-Proofpoint-GUID: g7WtcL1dcGwEVgpbLrihecz6GeaRCQgj
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad8aa60 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=qltNFNbxueZ9_HQRUAkA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX5qTUSOKmkhMq
 QDqPelUpeUlVzS6jiRK9tGNoGSOlvAKgoLo5uoSU0IivnWrWcyVl0Lpff/uSnIIMT8yGbrB/FGU
 hKeJbZmxH8rs86y/QBHdHHNyfehB8EUWUCHO/dxhc+srHqfR6xpqFyS9TgIraGlDxgxI3ap73iP
 8Qc1/l2BDAQpLMrNm77qCCDH+m1xFGBWxoNPQTMVxkctJC+vF0sL2OpJifuc1Vv42X1LuLZ0+DS
 TClwlNoRrATddSbPZlGy74f/ELyLNL+yTHVQd2RczUZIoeJqXhPSFBEFtfU/VMsykF4ftAt1vIf
 c7WaR3HI9Dj6ulg8TdwiiyCYovsHlWnqLk0lqdJm4snnqgilkHDRhC/sTMTTp88rAOuTLJmblYY
 IlTrL9kgOqtXz/aXFnBTYEOIdo1cPPt9bCjuM+mPwq72i9BAyjBFvZVh5+PZHs3vs5Vmyr2pdb5
 cnTKevVZGZ2p0zlZ8iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0OCBTYWx0ZWRfX9D72tlPcjn4X
 WW5cttvs1//hX8ozd4lHEt9cDTEYjQVJ8QCCyTqkExH5KFaWz8BLOZx1i6gkFtgyQus3GzOrVF5
 06rFXVpDvMx68l/bdfP2fiFaQz6mZLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210048

On 26-10-21 17:15:02, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
