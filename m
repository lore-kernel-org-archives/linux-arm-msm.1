Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447364;
	b=FX3gQ9V2XZx+ZjaJjyi+4b+KNjLkYS0KE03HLsPqk4bTjPOk+xNxPFhI265udHrMXJoF
	 GUsiPPIyq8ZC6YmjTVda8PAA94LaBcreyvWe13dhWoUofwP9nY5729+e6AalAhPkFqjuP
	 SilzIxf+1wkQLOBYNrSgJGDJjSLNVQGTioBCOEDJh576BFTFePed82HLpi+OB6n7PNHtn
	 eV+h5lxbZk+FzpAIoOBfHGTgOm7CYnYHglYPdKcUfeLvnI3lk+GATCQS4JRoGo2PbgAsM
	 wkAmuyggZ3Tc6336vl+p8Sxon3c4vAz2DLXoTsld5JxbtdZEAD7WvDbmy562OB9jwtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447364;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
	b=ev8ESBuiUSbZefUQT9lwka7hfdUXmiAFQqcrxObIO3mdLnB7ujvmLkLp9QZl2bdvA7eS
	 Ijh7umF8j7KV7qncTJyq2iIogIGHk9eORPTu1YPjfRbqzliNTIQD0dlMqhWdImJQGfOef
	 E6TfHG7Ms1huTq//BNrpvuQMj8K+QDeLmmYB1FrBdDb0BJj+QPCEYwewjK8D8wn0IrbgY
	 2n1uTbJc6FlmOGIB2Y3rJo/RNUqPrTj7gZY9j2pMv4Dd1OeXRX74d2I+X/j3S5gPp6Q/O
	 End+lSLGdIG+g4u+mzdGDQJNesYH7OCIOEatKk+X7f8J7ayrzMRtAceJcctaX8vmqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKRKNDNe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EazubB28;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB35606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EB35606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pKRKNDNe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EazubB28
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL5wU3072636
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=; b=pKRKNDNeUnPfQ9mb
	XH8iE+F80am50UZ3mMiCo+3v3OJKqvY7idXmOwqANSvjV3nXv2KQ4vvmjXYh56yI
	pc9eqQZ3ypZ1Bq0heUxvvF/khk5Pdfz8/+bhRp3O8mw7DDDwyudqDk4L2ohK2ts/
	BKOvglWmZOe9vQOKAHNEpyeGvcQxH/DlU9AlVvR/TXXu3fl7sW/EqvjGlGJUsafc
	8pmci0wxw1Dr5UVZPKNwCv0136+W60KyJbODjyB1IqoKHdDm6dQgvXv23pQq9k2A
	UEzPmRgaobE0LHD8asX7as8ZKzC6FDTIznl+lDKUv9MS94HeWlUHtgYXPlbc29lI
	f4EFfQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4hn7snvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:22:43 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ee433ab272so93667e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795447362; x=1796052162; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
        b=EazubB28DOokzZsadaGTNecS141IMyYX1a4xZhT7GKSJ7Ch6MZ5424s6HrzHTuZS0o
         5tugX0U/YR6vnSk9nlxppVfbtVXw9Kaf3UOOJ4ieiTRYxBG+xK4v9FnobkUq2w/inhlk
         kMElFvIbmEthYPvFUL10/pAf0sWMzIQgNz9gorJ2iweKPBCBqD/nbQYJFzxhfpmSslO7
         InVMqRW4vcvmpRer5kglVUaJppEpjPuBCvbCOxaJyK+8PCZSEBfWoXN6lHEf2S0Mm0Cr
         p/m2BZPwrVuFvxU+ia6X5DodvMi8mMLVdNrCkcKzvWPm5jMOu6CH9ZoKI3nhPF91S6Cs
         nvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447362; x=1796052162;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0vDMs+igaYA+28vUGIdjnaabGanSliMe9F6/NhBAEM=;
        b=EfkmcKp/6St8lTAbyWJ9CUBhSVAkQuk+4o2U1WZiKEQTyEj7UlmLtKo0bWFJNXQsVx
         ip/vBD4VgVyXXSdBk7kE37ablkeLfQMaVjtdqhP8IVJSilR8XnoWMOaXu/5ihXdZRlbs
         VJm8hIRITG2r7qWe1NllKE9lzx/IIyKGfEaMZYpnPsCU5IHPc7cqglhUJFsEeBpshA32
         61IofNgU3+Eb/yO/Kg6TPwRinL7b3dZ42/pkwqBnAOGmOQqfG91A3Zw/PRYD9qpKHCqQ
         48GxvG68rIxnJSPGcqhenNWeHf2nAbAKaefE7ITZ/mK7Fipd7VLch6LxnBHBovaWnrX1
         ttJg==
X-Gm-Message-State: APuU4Z/n6GfkQFADM40dp6uBx/AVYd0V6aJPL5A/ukM5M4rP601Wr9bZ
	/Q4GyIWwGC7vonVpNxJMdpMH9879Q4D3kBlWz7TLhqrE1S0+vIb7X3G3l4hS0fKu2C0bDqHUMvM
	FB3ilMdqKTrfZeo0JeomfnvIZpYnLsHlpyaVqEfVc41QuoKfYg1XbG0qWHtWcuyky47wwoKUDlM
	Q+
X-Gm-Gg: AZFdTZcYC+JubzXV7DJ/nw34mQOt6akr+727pDionOQCGPbjvLkjfmUxOL8TxrWL3L2
	P+mZ3dcOAS8SSGnbS9aQ3i9insHzwJi/MbbcOhgaRK8eT1bhO7PBWwlZdiIQBm4g/tJAWiVQT+J
	wyVxi6XoO8zdWxLv3FhF4/xh8ThlrpgBznrgk6edwowpWnadPv1Fn09J3EwI09ulxzNCclY3f5P
	CyAkSEMmNz1er4mgp3rGH5rdIAOEHfFtG2P7SECVwW96flYNqfdSAo+LAvQCUvMR7h77KINymOE
	mtEr/WTJLRJyyRnox6BoqSGb+1YaIMjMvkxLoHAw5aA1b3pBmwYZpqO0YzC/7maEB2sgNkx+yPy
	VgOoc0zfYDhiIeZB/nvBUE+PLLefgaHefE86Ex2WhV+S39HTP3a30MlHLsyprdKiJ/NTp2AQ=
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr6159259e0c.5.1795447362464;
        Mon, 23 Nov 2026 07:22:42 -0800 (PST)
X-Received: by 2002:a05:6123:59c:10b0:5ca:7731:d376 with SMTP id 71dfb90a1353d-5ee8b009d61mr6159210e0c.5.1795447361968;
        Mon, 23 Nov 2026 07:22:41 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm422901166b.83.2026.11.23.07.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:22:41 -0800 (PST)
Message-ID: <67d2efc9-74ea-4335-9240-9ba6b480b28f@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:22:39 +0100
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
Subject: Re: [PATCH v2 3/4] pinctrl: qcom: Consistently handle IPQ5018,
 MSM8953 and others
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-0-958e205b1f60@oss.qualcomm.com>
 <20261123-b4-qcom-kconfig-unify-pinctrl-v2-3-958e205b1f60@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-b4-qcom-kconfig-unify-pinctrl-v2-3-958e205b1f60@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ls0HWXdc c=1 sm=1 tr=0 ts=6b045a43 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1D9KFhC7uxUtrrzGQF4A:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfXyx/aQhnXBEll
 grj0jQnlpk/ADdpECjDGH1flgEqfas5hqk3tV8wh+xZDlWReCteSOlzPU05ODzxWLqv87RweRq5
 MeQORflFaq0/srjhVaWjxvsX3SmU96OrjGAEkIdmYJ0+ToyCuTAwA09AcJlxoQZUSO8bd2Rvu4g
 RM4oSFZhF2na5vZCw9J+rqlcV4XPWMWYVRBFuFGMPNuWTtOUSJzL4i7InHD4W+nESi54Y3lxE0q
 OEunu4JQqkVabHhJ9XD4AanGNckYK11I6Kzodxzh3yAU460+akz2oGZQe+FLXkENMsx+j5okiTP
 tkl2iHmlmHtUy150Mc7qog0yqY9Z5YufGEtb2iU0Bu0tccUyIZKtF6DoYsO21XJuZjnAdOYyiQ6
 CR7/YYRhkYkzTJfKCIfMAEAWqUEzWfZSfUddqER/rhRG2zyWM0ykOiOv4MCky9mCPP8BCGcK4I3
 kex6CU2zCyaIQRkcqfA==
X-Proofpoint-GUID: hHYkmb303SBsUAyr8L66OyryXW5K7d-q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MSBTYWx0ZWRfX9oEV1kGgnInC
 LlP1wpTyaDnuAPtukG20sEywOJUzCrNOwD2qe/gsCEO1fJDRWdcGngSqtOCBHeOO/EJ4adWaL7z
 Qwq80YBm/L5qUnOX9D4rPeIb6AZHg3o=
X-Proofpoint-ORIG-GUID: hHYkmb303SBsUAyr8L66OyryXW5K7d-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230061

On 11/23/26 8:44 AM, Krzysztof Kozlowski wrote:
> Other critical drivers, like clock and interconnect, for Qualcomm
> IPQ5018, MSM8953, MSM8976 MSM8994, MSM8998, QCS404 and SDX75 are allowed
> for 32-bit ARM builds, so pin controller drivers should follow.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
