Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596036;
	b=MeRUI14L15wi/4YNaRX29OB6fuVdJEev7XCAJCsdlcD+x0eR2DINPh7VXX1szzf2z2p8
	 nSCXqU/3mqXxmIECepei/NoAiRQnUVDxYVvHKMRVae2O60bXuFIMWQymHr6r0OnNatMP5
	 1pTu0tpzxGxJ/SnoGNNotkbeyKagZChzSbcKuxWgPvx7IafsiEblJreyxEPEa+4e0t9lU
	 epAbAGIqLVtVwg0AkGv/rDNhDxwky8a/dhd7IOyddoPWpkG0qWH8zdnLlH4vr1uOIqROS
	 gfQi10mujnyQAZVbv8l0HGLon0Pul9Dk+2i+6Z7G7dwOhRrUjK22aHZ45/r00NLjcrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596036;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
	b=HLp9lkQWiEKBb/utto5hQb0jSHiGI0hkWFExWG6zUhY/s6BJspX3qbGUoPH7FbIHy+46
	 ZT7UsQWke5tJ9U8g6Ue3wtQA+JHUfVNRGC3NkmhD6PrQpjNuTvQ320teer4C2dzLURFoo
	 v68OLvSgA+sra1lhcnNjDEvwOV7QwTXkKjhWUMv3FXNdgnPDb+tpY8ZHVUv2x5SjaNQ4X
	 r35eQYoxFOoaIi2enAHXmGejnGv+bY5R+qTfPppuvQVthpgG9Q9vgQxE0BK2kA6j7JnGK
	 XP4h5Sed3Ng/5I51QR3OJtvp3H9dOuiBmUDbGrs7GkAs2nXlqLDIflXzZd4Mmyz2xIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCqT8B1M;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDBC606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDBC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HuwAKegk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gCqT8B1M
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRSwD3296067
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=; b=HuwAKegkX9jMFg12
	8X2mvDeal8wOWxeqArB5K11MNcYclG3pSIdPE5EMyT+DQdrS9acUZwPOxI3xNc2K
	M/DsqNMgSRBl5lZE8PWCfA0fKsbYB3RxTmnkWoPmI6yASWMhwuyIkYxWbDlDz3qp
	Y6fWCA3wQRJbEZiRoWtZKZAb2ZWUu5ECzAbJNTPJ0EEqPBRFSpVYAbBjx1I9UBNZ
	KT9t3VeLP+hcC2gD4VyVvRyxDzciQ8fL0zMXkGxeeo2b0XTGLqnrbuOf7Qd8P9nL
	791E/2JIjxNxwk0pt9fRE6yDCn+95vjB4lppTfKklZfYQpTiO7Mltt1KCPiGSnWi
	m0gfiA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6tpnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:53:54 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b238436265so631114c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596034; x=1795200834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=gCqT8B1MTOe+P1ljX1RR/NZ9BNxiKuLI5VbPhsi3fbEyTrqwQ7eFAGEo7OlAwZqqtl
         E7nyspxwHXGnX1LuwQFUnUcfhy5IZSW6xSIdjuRm8+yeSutM0xmmXjXB2HV17Xrz6A7O
         FaLjxyyby91xLD40Uv5eRj656hJni4yEb2voPHnYP0HLpWAA9Pu4UuCf92GYKf8f9BiC
         GzpFog96Rvc/1GQHUwfWcqq0RSk+KJNj2zvURf1Qho0RdWrI+v+pN0uka34OwbDjLUqE
         h0YVGqZnWjIfu7zVPI4iusb+/3L0051mU2vHUTBI29r+n+s7Q0bdHADLgdsxsHgc/BfQ
         eBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596034; x=1795200834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADKYPjbLhp3rwmtv1P6xGRTOtkrIn3E4ooScWts1K4k=;
        b=pG0GrzFHA4/oYmBOvlWzPhkKaNg8q1SGjvUPySAwB1wB9EG2/5wEfe6h1djqydhbW8
         Mch73VgBsRQf141zGZxv114in4rJL/f2gH1qWBpHuZr5QdPQPMyN7iOXK02Mroz0dWgB
         mwolO1Z63Y3KQhByanUY9JvYoDifZqSKQge2ZXysuNzJ/YZwGz4tbkOc5+KaTvZvKHsQ
         qBnwzE1T/5K9B/MlURmtd6/QHIz4jigFCye217TD6jnfF6Z2yPVoJM0WSVARiobCbw6Y
         lOmZrxB3c/m4/NEOQv73PWicYSz5fGPTCnvFEvNUQkW9vcOc2zPmGgK6sqyGj9MzP/Hl
         5vuw==
X-Forwarded-Encrypted: i=1; AL+hErFgvYp6BERTn1eCFD0nNZy5AAEHPBaf/seiGD5SBxB3xXh1moXAc91euqXb41+P2iGm1qX80MYM7WoDj9kB@vger.kernel.org
X-Gm-Message-State: APuU4Z9L8Qx9Fi+koPiSUH90v86LQYKcmsWxIjCAAmJRdqrXqMMj7wQL
	UBin85D3pSe9O3HVM+BoqSoRNZCYEa+sg7khVnIeTVd1CYVIuyU8xOv/iWteB8kMwFgZ8LenTPV
	XlEig6fLilU2CJVATidN/Y6wZL4D3NwC0IKOWivSVn0hyrhUSjzUqInJDgsR4EWrdD8oT
X-Gm-Gg: AYBFou19sIolccZARNH2tVZakT3zKQvDccbWuB8SYQlXRNEjgzx4Ew0QWCWVpreCTCp
	N4QdjlOyMMXUCcuOuFhETY5G2GprOdbK2cVqypxi+dBXCxcHW0pCxGhJE9dqAbXSMjMn+AR/ymm
	CY1RPXpZ/dC7CzB0/HukSDpRL82Khagt9dAJm4h3V1afD6AndCKfu6VDu+l13wfzA94KB4tTyvf
	yNvyp9mwxOMwwUiF+tD96dhR9/f42xOqGMSXxTve17UR4SG6EDKqW/36j3XC8yvkwqfZL7iOT3N
	aoH12cATOfIB7dh72PL1h/JRfkblWzWvQTlsvgGiW4pMbKlJC8OQLBIYsid6EibewgSHyUyu2Ox
	b6DZAVyg82O/uUiK6nbG+9xsZ3WP6GTyIZEFH6LF5jq/JzfleXhpE05uQxHN4UGQhDK14bAqQC2
	ky3U35gr+c6NAEWuZT48Ebc0E=
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253798c88.21.1794596033554;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
X-Received: by 2002:a05:7022:3b87:b0:190:da74:2c89 with SMTP id a92af1059eb24-1b5030b7a1dmr3253779c88.21.1794596033072;
        Fri, 13 Nov 2026 10:53:53 -0800 (PST)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50309b2b5sm7789937c88.1.2026.11.13.10.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:53:52 -0800 (PST)
Message-ID: <84fd339d-c8b2-435d-8e3e-648fb4f889cb@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 11:53:51 -0700
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
Subject: Re: [PATCH RFC v2] bus: mhi: host: pci_generic: Add MBIM-mode config
 for generic SDX65
To: jimmie.lin@gmail.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, daleyo@gmail.com,
        Johan Hovold <johan@kernel.org>
References: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261110-mhi-sdx65-mbim-rfc-v2-1-f1d71a5ac9ab@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX5jX7qb3IDMy0
 OhgqzsO29G5H00csiNCpsOVnObQfsJFj8PCBfr+jTg7HeJ5KEJ3qzZHoXdmAtAQogOII6WvfeKp
 6wA4ZGbfaK/vs+LAAL7aBPTZXjB5c5XvV1GlcPyEEmnoPQfSguYWFSQPZWumYpUf2stO/Vim3Mc
 Z7HbeE5SE3tlPxgRRPL2mTe4Zua3OhF/S90WsiRLKPq6ncICj2TZGrQ0WzTdzvlWFatOffAp1yH
 xEA2vF9rpcv2JS1MFn7XZRLf6z1VQoWbmpuKI4SJ8eW+0tueECubddOY+UU3zDoMZCnD8q95fc1
 Jc+nfnwhqmMxrdUboqP0OdWp6NF9CRgnWGcBwQ1oW/kWQvGrosmAqyswyg7Ps7jdsux53ga/S+s
 pkgoz8Klb3CLuuNZWojqtQDkFjKcAypcIXnptMnqGXCg813Ew15ZNeCz9SK6jHFTA0m74M8MLxC
 gL65HBmmB4aOnLcyX1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX4Sq+yxwPg9np
 4zbEBOkKauXZbxMcYnE2oYWaYSEjU1+W0budEqzEvXeENA2OJPFDXelLz3d3ZREwCIGZV87h4kB
 ikA3uZekhL1PSdRFA0j1yXj+dZSXxPs=
X-Proofpoint-GUID: NLdftKiokM0o1N0p4PFSHvrV5BKRJKzU
X-Proofpoint-ORIG-GUID: NLdftKiokM0o1N0p4PFSHvrV5BKRJKzU
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af75cc2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=rHAfOLCqabZJc_1WEVQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075

On 11/10/2026 6:06 PM, Haipeng Lin via B4 Relay wrote:
> From: Haipeng Lin <jimmie.lin@gmail.com>
> 
> The Surface Pro 11 5G carries an SDX65 that enumerates with Qualcomm's
> generic IDs (17cb:0308, subsystem 17cb:0308) but runs the MBIM-mode
> firmware it ships with for Windows.
> 
> Control is MBIM only (the QMI channel never answers), and data on
> channels 100/101 is framed as MBIM NTBs: the modem reports a WDA data
> format of raw IP with MBIM aggregation, up to 32 KiB downlink.
> 
> The generic qcom-sdx65m entry names channels 100/101 "IP_HW0", which
> binds mhi_net. mhi_net expects raw IP, so no data session can work.
> The MBIM-mode modules in this driver name them "IP_HW0_MBIM" instead
> which binds mhi_wwan_mbim.
> 
> Boards with a Qualcomm-ID modem in MBIM mode have so far been told
> apart by subsystem ID, like the SC8280XP CRD's SDX55 (17cb:010c).
> This modem carries the generic subsystem ID, so select an MBIM
> configuration by machine compatible instead.
I'd like it if we could query the hardware to determine if it is in this 
mode as maybe one of these systems has a SDX65 dongle attached where 
this workaround does not apply.  However, I am failing to identify such 
a mechanism so what you have proposed seem to be the best solution so far.

Unless someone identifies a better idea, this seems reasonable given the 
situation.

-Jeff
