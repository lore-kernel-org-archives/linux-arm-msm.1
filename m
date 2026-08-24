Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3AC3EE1E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561964; cv=none; b=em36yIlZXFVCz+j+oj55gmJL2uGUXOBs4gJT5RzTCkC9r2U+8H6+7P0oY5g2B0lA23yKM6XG0LJmr68X4Nkbh2ZBeMJJnGnIygt8SFcUZtbv5WMgnCzcP7pPJ2meULHNG83Qmhn9JEt1/ScL9x6KNWL/v9J89vve9AMkNzPJ6CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561964; c=relaxed/simple;
	bh=9Yeg4pEJAq2y1vfd7BWO5GQQThMFfvnhf4s5AWl9EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rWQzcXc7i7z6AV4B6TAF3GvelupRTrQkHrDDw0lBZi1d1vwPhdu3FMn+HnC3WhaUyofzEgQsYM1FZNzmpRwapDbfFI9neaK8l4FJpZuprJ9+9uYkvOiJtwk8NFO4TGURZJudH/XgkYaDSoNRrwA/oiePeaG8ALpdy110qhfVCB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdlAzuQV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8sblAiT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdlAzuQV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8sblAiT"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O6Sb8L1982459
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=; b=YdlAzuQVQpyMLmwr
	8zZx/r5jylDIESIHG7/yJft+Xi2E9KLzrKi1FRjZKAGGrY7ZvBshpymEhLnOw9Xq
	+MtQX6w1fgZuk5AqDO1bENgCyHpdT4EyNKlepIjE6wcB64k1ldB584NXWG3PIQkI
	JBlJ/NDxW7X1OX2LfFKYSUCDdIsaTAoo0KUqZlcsNvVKILb/sPecYkdZvSjw+7Nk
	4kLyODpIvZ1EyQiJ3XRwjK8IWtQW3NvW8G8N3IzZh/5jN8XCCt82sZSnAznOwo1C
	MPb59y0sIZUJ/OHH5IpC6JTxQ+zh1J1BYRBHPZOCioUl8R9ebcWzIugl2n+KI+eR
	jDP0+g==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gqn8mmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:59:21 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c46be4adaso36138241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561961; x=1788166761; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=g8sblAiT4Sp8eQVN+U3iqDGjT3dX54FLIvFZr6a+M4iZAIgu1+gaDqrT4be0oObqWJ
         zqWDs10dz81i1CApfDQ2SbakXWrprkNF3gyMC3D496X1+e4YuMnOpQT5E+2DmWC1d4uN
         GBLfUWk05fwhhX+pp2JIpKWO7Ezjoc0RXSU38SQ0bLnEc5dnuot3PHTFWPG1gPMlU8aO
         KFKCTAMQRjcpPBn2sNSt4IeP+Ql2MuGDi3F/iSFid6JIKsVA4OuCNbbL2T/SU9lzkC4/
         I32QinwAUczrWweby4ngnscgSUAHHpRh15KWQNJq5mtjjSOB/LcJfAPE44p0ikkjaaYm
         xKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561961; x=1788166761;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6Uj6C5D1+nrV76LvOx+T31xK7JPMs+/Y3X09dKPsuI=;
        b=IdjbysRRHpweA+WdM2gc5Fv6YIxVvMXf24BUkYn0cDjsINySp7L68Qs/wxeGG+5h69
         lNHOQGDbtLE+Sci6xpo16+1Qqz+BNL9ym17AIih9xSWVa0pyj0zEEbJ6K+YeG6crsfCA
         xoml1ORS6qbDnp4IsvPiTo4FubX8Ue/0IT8CSSMJglkjA2BHUHTVlVqoy/H+V9Vik1mm
         92/VBz3050rqAcpSGyW0p9tyec2rohb+OXxVjebfQcUct6rsjgMQ5tN5suotVhAAQR4i
         Sr9N23Io3HBLECpsTVCS4ry7UHbPPl+SZfSZkUng04f058IsdIBZaljWOY7rW4vDxMts
         5u2w==
X-Gm-Message-State: AFuF++l7C+QhlJg71E0PDmkXFbgktlC1LxwUuUOKQy5er4tpqeY2ZBv9
	98avd4nxlMZUXCoS9mEpiUfUm51Hi99lYqWuCLAa7lEwQLf1QQxidNBwtUi9svJphVdJhAOPvGK
	PL3Yu6LxcYy8SSS4bieq8p2Oik/GR69usiqb3QQY9YD3thMR+mt32WfM56kl011Ldqp7s
X-Gm-Gg: AR+sD11vT4Tx2QTbs6mm+tqLtC+9t0YzvnaQ6KLCeNsh/KRobO03CbslnQq8L4W8Mkc
	146KL6lXf9hFa5VjG9vzvdUMBaYyCYxNLwTGrfVVPJJC9YWZ+IacCoillMCotHqVy/NnoR1N+m/
	uDUGevuHd9G+LlG5Rwsz7RYwiDheomYY6iRv5R0Sb1K3efbX5y0qUGHJS+j1Rkah9ymoQvCtdep
	KId3SoyTtdYHfXD44PduhUzChZ5WP7+J9wOkvptVn447esX3F+GV8TFDpDD3g+XZLNraKWBjSdh
	pUN1l5gHTxT+2CW8cgPtooZhlRr5ax9yR9noA4OjQ2yTJEBfedHcXh/1FylskShsh5MAo7jsInt
	8H3g5vlSPJXtp7LKrrKin0fQw
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657469137.0.1787561960819;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr3657442137.0.1787561960402;
        Mon, 24 Aug 2026 01:59:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm8088185a12.4.2026.08.24.01.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:59:19 -0700 (PDT)
Message-ID: <2febee95-3c24-4244-8a21-1b769e90b003@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:59:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/14] arm64: dts: qcom: ipq5332: Flatten usb
 controller node
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <quic_ipkumar@quicinc.com>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260812-ipq5018-usb3-v2-0-8f355d7ff0ef@outlook.com>
 <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812-ipq5018-usb3-v2-4-8f355d7ff0ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXwwqm+BGmg5uK
 htwGHtgChlU6nXSlLqBn94jP0xxhhn/ALQ7Pw5Z9U2TrHO2WOzP7wCaEl/i4zXurZz6Qa+z9S47
 +xEFNbnfdG2Wl/SYatr+ySCtwnO75dY=
X-Proofpoint-GUID: UYfg-IWYVMjIp2n-DeiDgoKalyQUSShX
X-Authority-Analysis: v=2.4 cv=fqXsol4f c=1 sm=1 tr=0 ts=6a8c07e9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX174hYnKlJhL/
 E/gO/AYZiZLvOHKtt3ZbXLhr1ojqj8+mAc/Sv3J3X4a/33EpPUDWEOKrGdE47Yz8Juv09ROApt0
 W0CB/cYIVnrtkB/QSw9r05lXnZMGKj06h3yi2Z6Fk3nN+2g5JQ34nQ0Tl0IPkYOXwikHj8INJTl
 4NSJrL3/RqxTbN6ZhXn12i7i/PW+VJVPdT05xnHWcLkx6+png9A5ZR8QOl2SeqUZYlNhRoZWeTP
 knONZrVK95NAVBkS3K3Lq2lWudwHhlQQt8icp3HuZZujoo/N7eWY12j41MF8fMt6aoSDwtYhbPG
 dz5slPCjyRnRpBzWs7NiN+ZpisqxHC4b6fqlIO3COrnugK9ScpmC9X5+bn4hqlwGZbGOLw2FnBX
 Acr77oU5V3vkrh8mayLH+AOsuFNChF0K1EUt/HpMwINHEQvO54BtxKgK9/4d3YdyjMfIilzx7xb
 Agezz+kq8HoMrR1KQFw==
X-Proofpoint-ORIG-GUID: UYfg-IWYVMjIp2n-DeiDgoKalyQUSShX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/12/26 11:34 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller node and update to using latest bindings and
> flattened driver approach.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
