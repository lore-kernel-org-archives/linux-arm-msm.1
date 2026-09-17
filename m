Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F97345751
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658177; cv=none; b=lyp2Sd21GOjVKEyj1Ak+aLvJF/oLr9jAqCL9KGV5LnolaclkIhpbGo+N1R1DHjEBx4YKKmRb+7cUeQan6UM/D3+ypgQu0tonzD9sEWXKUoPT3PDCU+sy/e9qpfTwcxSRqC7Sa+cOfY6oY2DMjT3fqGJKrtk31WwJYmZgZt2OvWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658177; c=relaxed/simple;
	bh=lrvkzk4ljiq6+vQAa6UbqIX0W8hWaThfBZW4ANi6ELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IEMzWTUTE5lTsycFHrHLprLe8HcM/IXV3U1CAyFrePEa8je+K2qcs4JBgRR9KsSo/lNcMWUtMl0QAxINHZU5nBt9svvpsxK2ZB+v3yNhHltbAS8XESlmikSMc62rgD+fHdjU/DvFviaUeJG+MIiDjliEl84BsqzWcZ4tB6/mH3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzC2/7Bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DsnbXPHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzC2/7Bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DsnbXPHX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3AD2777138
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvI67hzw9WhPRXd+QjB4vXvb
	G5CPBUup1u653u70yoM=; b=GzC2/7BjkMlj/U+Awl/JTson5NlBOsyyZjnrhsQL
	xdkRSixPLGnvOw6XAcBg/qKpIQCSys6rmDaY3ZSJmA/KzllzpD89LdI76cDgftVn
	Nac7tGyUKw/3t813ghO6THmxue2jm0FuW1wcDlmGcP/AwAlhfULzH29wsv/h+peG
	Y3QQZXtRT0BHlfSRPE1rtvDfCFqfrWo0RWSDYafB/FZ3SDi+sD6MNQPTY3Qqa1D2
	7E3EnJuq0vGQnv0twG3DJ7O2NNR4xD0d1hpWClchHz9dxPIo/YpRrB7gmrlFJfAZ
	wwzPb1oW3Bzxu8Ya2uc55OZ5IK9QW5LGdJTNU/Btc1P5oA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m36ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 15:16:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8341cfb4so24177606d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658160; x=1790262960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=DsnbXPHXLtCglMOXbLuJuf0xWX+iMLqWL4fOMqxNxCbxa8IT5hb/w7WfslMvay+DD1
         rxzZuYEDDoamOXqtFpTUXxq6ADxoRbIwGrPC+kHQFgk8lFO9S1ZZCkc0OQM0aTz3ZMfn
         tY2c+p5oE29jL1FZ5t3TVTthRaKVq/6k04KpKG2yMxEJ+luxWXBKGp/9rX/HZ1Uh7/zU
         4wvFaoKYQczz2w6f4lk0ezasjKDEe0vdG7KD4lKAxotGATjBqmFL/G/1RGLw2D7/sJ2c
         Ar2ZRISxYd+VKYd1xaAy41k4EssF8uk/dwMWg5m6LfH7i5Lea79/28xqVzAgwQJ0pIpw
         5Btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658160; x=1790262960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=igb0o2XXckK2fnd4ibBmOKSh16UnIBuieRpsgNpO2JjH6enYpY66+GdOZmumyjKLPk
         ckGtx8ZxvV4qzADX2D1Ldn6tX3TLQxGsb6jj00MathfaxPzO9DNNQfRmdbI0xN8BTajv
         qifcn6NyL2WX3aM1c2F9YWNDGCQNK/1F43AVR0GCgRvwzIFR2FKn0Ex+NVdB1d/oMhGi
         AfCwt0LCvABHMBWP1wAm7+bwMOlGMjsLtMOnMMsouGtTVOT4oDxrTv6BLWZqyKsCAu8q
         /HL0CEqsYVAjDVWDJq3u1VExauUH5AwqRmldl3+NrZ//OXOP2Bjp9+aH/CmobQ9jq4CP
         Znlw==
X-Forwarded-Encrypted: i=1; AKwUvBzz7WORLmizsjEbJ/KLoRjPo0FJwQhIMI4udPCAs2+fQVspUrpRLjGHNctcjmqqLTSsWKvKrWqa4uqR2r2X@vger.kernel.org
X-Gm-Message-State: AFuF++l/H5ut5nq1NStMQKa8hxCMaOLdkdXuzZGUuH24ByzwwX8t8FV3
	R4YcYxvVY2eCLOq1+ijhmdnIl9DW7EnsoTFOK/z9lZjZFKRH5jGPw0vqFS3ilPb0N9nvEe2GG2d
	6uDNe2fmwKIg+yODpkqm/2366+OjfqYTtZiTtYfOOS99WWMqinytgCDtu/tLwvLftFYLE
X-Gm-Gg: AYBFou2jVl436rYURNwUHn0V1qMshhmNWT6c1RgMPsl9+lou0MciDs5K+Lcl9RGr7fP
	J77PmwVgdbAgfK7HTIIlJiO9Nmb1+QxgEsnuvpnWxPk3JMBeXzZKUoURZlOguudV33b0jKFyDed
	Aj0TwCU7DMNzLHmwfilNvwwhFbQKsf4XfE4P8vQE1gn6J8bnSmJeX3jOafguzMFpQEsErSQ6d9A
	UOU+YHD5IQp/LJDPc/WM8ernMj4zggZQ8U+/1GyFz7wMam9EGCgCvyN4xxzNNlQeI6zZjDb26d4
	n6lG6tlG9EStJ8fIjLsjrAok35N0xAwVw1t5aEvpG7VVYQETAl/vpYQfnqDFed80RLZOnTTu5KW
	Vbq1jugCvQ2YVlyc=
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133488896d6.1.1789658159585;
        Thu, 17 Sep 2026 08:15:59 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133488056d6.1.1789658158895;
        Thu, 17 Sep 2026 08:15:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7659sm17152679f8f.3.2026.09.17.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
Message-ID: <qsnfyxmqun5ffob6g7dtfi5babmafisdzuxig7o622i3egrq5m@qf2zu7iabstp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac0430 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Lv_lOm-Y5xpQ0RDPBJlWCSzAaWnUptjK
X-Proofpoint-ORIG-GUID: Lv_lOm-Y5xpQ0RDPBJlWCSzAaWnUptjK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX094LuiXti363
 zI/opnvtqSkjFd0+dU3qJrY5A2Fl94xLDfVGeU3DJyi+PWH2ty5Q9Bz/vVbVaOlAvS5XMLDXZkp
 TX1T9owwC0J2B1PLI5C4DMPPzvHhI72nZkzRTU6uu2sbhIgME6Nq9Zq8bZSm6WhyFw8oqF159kG
 uqunIqVWdMUEQFjNCS1yDXmwJD5XZRMHWfMJbk07ocAiP1x9hf6l0KvIJupfSa76fy678+h/rEx
 ESOdbd/bZz1TKAa5+kBng8CHNhbCFXtrJY7pG/9PMcO9mx1oT9HR52MD/+Ysn2Eupb7sBzS46J4
 xwyhHYPG+GgWX4+5z8dF0vQK4O83xgOZF2VnTMHx6TzLK2GaPIlEPWd7HQi8LupMACyayORGqT/
 QMIpczBKJL9kFBYZFU261vXRNXF7W4G2/I7MqY/+BhGLrVPPiRnBntA4pD7xTLo2cYFDVTTm48L
 6FW5HvuEe8aIbJ75joA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX3D8Ngm9RYL3U
 Ab/lNSnOdHX9ONOAC6DofmaQc12VmNmiiK9cappi/a1SchUI8ahJvKlZ0MrWhuu9e9TOwmD4ehU
 B3p/S8/Khbmum5/ZnsRxTpS0JMVPsPc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170216

On 26-09-17 17:55:28, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
