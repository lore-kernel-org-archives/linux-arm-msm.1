Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873536;
	b=2AcJPiwXITS6FIit1EDEbdRG9hl3Jp/Bqc6rBFMDsHMpT8NKEwL5KC/vgoUUqEz+J/Wt
	 XKHeKblh7z3KKLzHBXX/ov9ImEskme413duqhWvtvaeflfHuKM3fRhVkgFFHG0dP/EL5O
	 bGqcLtRApXFzf738HpD9gfs2kmRd1itdNR0VAwD7Y112XHSQZo8f5f1jpwumRxiLjmhiy
	 M2Z4fQri9b/h1TVsHs6ApLgSQmZoxtbJu7/zrTPT9DMws1wTL0zwxuitWO1P4aD99XjDu
	 Qpzd6A2YyuLlfe/Z3qK3hHIe63bXbmNZBpIdn7rIixlIQUYvFb8szshv8LhhQd5nvAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873536;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
	b=Orfjd4vkC2HvTTIOy2AcU95aI2Hh39aRTK6vIeyc4dUD/ZHlUQrTXrMqNVYTqbu7EB1D
	 WAMSx4CUFt8gr7h5319oPVOvGIscAF+ymBBj8hFEmmTZOudkHUedtjTtQykokc0Frs3nd
	 vqnEbR+oToppGMSxCDbyAdEnzzuxyEWqDqUIMJIi2Uqjjm7cxu2+fwqX6JIC9KSF9ff6A
	 QKKTV3VvY9JAA+Rqc59TVlz3AlVYr/UwYFJVlpBQ4xigTH6lroJHeaqKM7qp9DsX6hlkt
	 ivnuBITsr0O3RQKmJhD3kwXGK6T3SOWUeF2BlMb9mR9d26ylaPl8FWpzT59YWsJv1Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Dcfl/tLy";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42138606A31B
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42138606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F7iCT2kR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Dcfl/tLy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU6xb2307242
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0GrnMJRzACYCklZlFDtoRd4b
	XmLKZhxYbzdI1CXifVA=; b=F7iCT2kRM5ZF41/tHo0p+tbPbqg47B+3st2B/dlB
	CW6wFZQh+eFbke4/gZNevc0uusY5ql7Mgc+7vWSjvREeMAAcYQZz84G1wyahOJGK
	d0ojNS88rrVix8E2fvwnCw/HGGfgO9k36dxXTcYjIJuzEC6NQrEtqmio3EUhT691
	OZ2RTXfZsQ4MXWRGNLxhj4Wll/OLKRvljg4yO5pAjck6C6eiYvlqvPOWQwVVJWtk
	3KfTi/UxB9zX5AeY0sUXI14r+mY7whAulNHdJRmuYKqPyEq8l/VMfDilDO9OfXpm
	XrFnvsvvdCeCjeBJJz/sTH4GTzbWXDxmykTdS8Vl+R83vQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgj1pa397-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 20:25:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb98809caso350687185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 13:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792873534; x=1793478334; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=Dcfl/tLyEiNjZqp/0+XlqUbhaoCkyg2uinLu+FUAPddT4yj7na7s4AF0QAyd4xoTAU
         6HmxgNyHlV7PsSip9ZD8MS9OAfkAGd9w7i7w0EsBpN3Lgjx4is4cXDaL+hgGewtRMh2J
         P9tFoYewMbnYPRAf6UIfsXa7PUJGBEjt9QmmsRnpenNHp+ra1g0o1FtYYOn2nU9ufiw0
         epENCsyJ5hFKCXqzsfWMbadsHAUNRb/EoDIkbN8p6rTRJE3NLAxbkZKPtl8dC9TAPgpm
         I1AMepy2e0Q8bDQxP7zhRNM3A//xjb9b7vT0ZCq7bJOIBV4W/8ybN4oJ9suHdVpa+CZb
         b6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873534; x=1793478334;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GrnMJRzACYCklZlFDtoRd4bXmLKZhxYbzdI1CXifVA=;
        b=riRqWlpph1HkegW9ORmyeFmJVIkyaE/MtGVIlx5C33cbRQvmv+AzhTs20AO+ibrV0e
         8rPzsg9tLGmEGKQys7WTyCGrYRBrOctcvMO4WvBObfkV/LQL6WsROK1YQNLZ4UlZIfvU
         k+ypaAF9onX+kZFhWPUJKhmk2CBDkh1krSOBCKRKj6cL9v0lOX9Asfl3qXUupHxphfHe
         PghsaGEaHWM+2B0NvzVK/CAss7omIWjiMOxuT4SbDRiKOlyy/ui/J0CL4QFvB7YDEfvU
         tiuzT8BYbBJWHhgYA7nhfw2bDeKnxkP9e1JPPYexWheJirLK5t9g840adJgfqAclZ4OW
         RwEw==
X-Forwarded-Encrypted: i=1; AKwUvByY1gfuJRjTeBFO6R/K9CYtimr5Q1IAKc985UpThkChygoM2r1Rk9xQ/gV1u/nBIKItxQzsGbYqBNLJ2xFy@vger.kernel.org
X-Gm-Message-State: AFq9FYJmItkIiirB5ArvhvLE5St/5184z9hTxwFBH+TKzlLdZ46YMt1+
	mtk24ApD7vlv0bdTP7vTk8mr4EZInvIQ1U9/DdlxtkLmyg2B9urUw2q5Rl5JM5ZDC7z4Ln10edc
	tyXEKcZX2cpWlqzp5zdGZVMxADEehrTcY8I/96NNXZ8S5b7cyhi9erL7fQ+jYF9MI3Sk4
X-Gm-Gg: AYBFou3GCjMcepokV6RUE/0gUOzX4FXyhqQGssa9+M9PY6YLkuY0HFobiWQ0eSj3CI6
	yM6izJPeLjl2lQ/2M3caWGmPBMUh6ASloMLg6r0QIg5ldjaO/VZ0BwyrDNMqTdk9w46D4iHspZF
	uXsrRpVKBSh06oDZvgtv9NFq6mxmSqHyqvgOb/8UHXBbXdaat3HrB8q+cD71jthCAi3TyU1xwiD
	JbmE+lemFWaH5h+H+2TL6zCN8Gn+QMgQ8Por44e70sjE7ID9pelrM5O5CifCUVHOQalOmbaI2qY
	n8lr5qc5XkssmJQOA4Il16bCnB6CK2vgdwpMC1JMSCl4KcSf+90GyHI7y5kFYnn2J6xNMruJ7Xw
	9AJn5HV6xMi8By2Zr
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366122985a.73.1792873534253;
        Sat, 24 Oct 2026 13:25:34 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:93e:c35b:2332 with SMTP id af79cd13be357-940ef9504b7mr366121485a.73.1792873533656;
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm50361415e9.3.2026.10.24.13.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:25:33 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:25:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <m4nlly2xic2gdicw633adqd5zwouw7qprvaobc5ilvzttaxpqu@dzx3shnwidkk>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfX+H6uIGyYtO1P
 KD9f25AWotx+VH3x0UnvmVo0tQOEQitl61N9rxk4TfN71GTtVXhPai0FZP9CyivBl8n5MZWAkXv
 gCIAvV/LwKZGz+WzahFkxFob0lPU88A=
X-Proofpoint-GUID: 3zgpeGuVT5XANNrXywVy-KpumOim1t0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MSBTYWx0ZWRfXw/aQLN1YlQRj
 IYpb9q2O1mXBh9I4ctptKDqFVbgWONHIzSD3zygeESHtZpWFpbsu+rdy9esyG8EUmzXdk86EWza
 RGeU+poGTqZWQaqt2gAYbMJqnu77hFXG86xzhmx3NLj1H5jaN9YfbFDB5zj4FcUnzMNJdTO/1Pv
 EeogBdMFlc1w9dkdoOS5A9PRqO2XVgCwfpG0WKBYcb/EmcsuNp2zULP3qNCOWgnYuoyd4V27gxd
 eacHcrW0noimlfcQlOpswShLUx06RaxRFpCrmGWlt7UAYSPiS4Probue3m9DiAmdSi0z0BpQNTi
 IqEN8bR2O1+yec1bK9EGhwnlIvaeMfzW5RfZ4aGGtsY2Qh3qAzlmh2GNjOuGIkXiKbAOEomfFGn
 w7bZeSBWnghkdZMSiNhuYI7nz1apGBAzZ6Hma8Qfwea6/yuAg53s+JrDONdeo2gMtEHqsTRhGF+
 ceGribuLj756JpgsCig==
X-Proofpoint-ORIG-GUID: 3zgpeGuVT5XANNrXywVy-KpumOim1t0v
X-Authority-Analysis: v=2.4 cv=D5vSufRj c=1 sm=1 tr=0 ts=6add143f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=3Q3lADbaBCgA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240081

On 26-10-22 11:36:23, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
