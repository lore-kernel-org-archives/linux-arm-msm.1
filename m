Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421575;
	b=5iDhKlq1Oe85dR0B1r2ColqdzdbRJK7kpgXJqyuHdHlamoSx5IojudyBwNqvF/WFy0Rm
	 +Y4qDPptaXvmIWmazbSydkZpYiH+AXKhHVnNjldJgUDO6PzgoG4DesvuMP1XQpQhFXWAk
	 4FO6qDSGkCUYy+Cx0HUvsCYIbO6kyoE+GkQdqMSgAhftKDoAGxT160gFnHsABae8eHcRr
	 geQVk38jVJUNHUiunXNiSaGW/lRKNodqEQoDa96m5FutFni+qltcsP4UC2jg9/ByYG866
	 m/3L/DH1OoJ/0K942ktP5ILp0iyQRgtIDxzHrR7yY/RQl/p6O+1umPNhOz5r76HyJ5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421575;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
	b=dsOthqCjXLt0XlzTpwyfAJ9NaYUDV9nr6CSX8iHIDWfBLDKykZBdjaA7ol8/gbrfaxh3
	 rXOFUshSxqmUfEm252dtIh8rbS0w/uIoKdxqdIAao0OxV/ecIGnaN8tgWoTZdCMqFt7EX
	 HHRsoh4cb94l04+RfKVQ38vO2U4HJT40agkA6+DWP75GOE/56LBwgxQkFHGPkGIlxX7Xn
	 qAVW0QKIzrVOIR03K6Svfj86ebIdAfkpUix1oiJTUM1Ha7tRXrZRldNRwRYuSwywiWpHF
	 l4upxS69uWxwUVvcVrdU5IaQu3WkhHjI6QgZLskbY/hsVsOJiYmRKVMi9dsFdVWgx3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="o0H/27FL";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63931606A33B
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o0H/27FL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WmzJtK5+
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E55008D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421575; cv=none; b=NtdKwJnDkyhOoGzd94C7w7NCZT/L636ZnnOqyt16Y8PDmsAqr/SEYdcKZR1KbPWAA+4FWiJ1hfQQcfD7hKa2f83B59aAXTgT79q1zbGaoSm6Qfh65n7nbSj7LhIGjMAjVe0h3cGa4TDj53YfeDO35xUEdU2T+HTrI47SyxauWhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421575; c=relaxed/simple;
	bh=orrAvnQKodrO0KGN/q1mi3EWkwR/z2Dn0RbWC+AZp4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bb88yRXUara6zRZ9LWErEJGGLhD+gL+zYKsVyMkvgX/TEPwDU38r6Yryf9+J/2u+GJFt/VSFhr5IHHAR9zEQA4ViU26X9cIulHqVouIMdSJOzjdZxwRDNRoLkbn+uTHjHpl3ILCRjxklqwadUQEzpnrxxsZlUWRWfFBoplyOhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0H/27FL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmzJtK5+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE05hD2626610
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=; b=o0H/27FLsKCbcENd
	zuuZBR/4NyfyMNXLYkNG7wfXWl9TJQc5wQtIiqdnMyD4LVcYUO/4FGlBTHEoFGCn
	0mphYX1DZ4I3PFbjQD7EWFndAtFiXABmnzyH52QPRkSUWDYyh5DwbV3k13KMCwT2
	3WcoPqGuke8/owFkINPYH+7vF/NzXVuUx0IMwlkS3cbRZ89zwqbOvvEE3uSr3XBS
	nMV113UEy8Z+di+Z+3/ftstE2Wx5BXjBwzEaAV69Cahegn8ggIN0zO2Ydk8+nuJ+
	SRGSUyi3yQXU7aWoYyqXPX1e8+GoPOO4jyLalOeZ76xjuCEdaBILAyMIhgOwm6Nf
	KkOWpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgje7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:52:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac5877bso40202185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421572; x=1793026372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=WmzJtK5+FB09lwKb27nYOHSRSUtjfmqrIx8F0G05H23MR1+CBMa70H/joJslgaLq9P
         aLr8Pe3svLcfbj7SizNhs8UOVQxsohGzym50rQ+2zO4izV046jjOkdYwepG+wB4X5mch
         IUJigmalNJWqPP1mDKzr/xS5dvGA8cOlHcQ5Pir3HmbGUeoloTrXkKy5UFgIDlDWyRx1
         dnKGPG4lh4DF0bYzr8+T2tOpnY2SdDXEGy3Ilm30075tZYdFxtRJXwzKb++vTcQp3sxU
         nCuA/4IKP8E9zEzRYR226IaX6mqm3vFToRN9fySm2pBpjkNvaPOXNXSLlAh4/prAFJ09
         GRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421572; x=1793026372;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAvTCsWSNng8EghTQUQu/Tg9x/AcCtimfJ8Eqqx+Ujg=;
        b=W77ggo/DToKFITaliUodi+joVmwykj1aQ1HNfHeNv3aRfvfq+66Uc/nisP0YZ6Jo12
         +Hw0WeFt7xKEXcFTRiL2Ym05kZ2R9xNadITSSP2ZxoqdhXrTooYjzpVQJn2PGpxBiGmX
         Ur1POjRx7NdCSIRif/TVvma4dr23NJvL2oeHeJqSeNuCEZlh1xwQZkI9guzLjNaaHH5v
         ag03RF6ChC+BKwJTCclYIIR5+6dCLdCUKOblAnFlDuklvo3PO+BVU9/ry0tNE49ZeAp1
         rAA5hKVM/v1l4Pfsb6FOce6XtzvEAFCJychKi2N0OaubTXEB0CciBjbewf5swY1cFpCf
         klgg==
X-Forwarded-Encrypted: i=1; AKwUvByd1mHR3sdhFJBmk++vH7KDNRCWi6LbISeBIsvp2CuXepWHNCXDDNV2RcV8Gu7KNZmAtDHjKRSCfMVjF9dd@vger.kernel.org
X-Gm-Message-State: AFq9FYI/iFedtjO4G2ZKWMKSGqNHOyGeXJWVvgHS5GrR3xsy+w4TTX/H
	J60gNnmjR3uXIvgcoiZV6Zyv4EjJ0lpusf5/MaqQDfsUFfrCLUD6I2JCWqJkVPoPuKD/oqE3K0v
	/nL2UniUZL05E3uK6LdWZE2XM44iOoLB4zfosSscb/5zAhTThmnCt4AHO0KTKO5UShgBr
X-Gm-Gg: AYBFou30ZsxBQ9nqRN36j7G4nx8/qqEL4Yny8V88hPSLQaY3/AeXzYui50H8TSAxnbX
	0+QtR+YyLmLRJL1vkfyKUd3+aXiEkNfA0WyYxQv4Q0v9MDP88COPifI9BAvYi8okE3ZgGM7st/8
	zHXmTjrTXZwplcZowPa8rBN9oAXy776QmTHcTbkBBSd0RtldO4uEwQh8+5dYaiZd/F96IM96IFv
	QD7NnxBjJK6+JXI0yPYdvtEa0PyJvR9vBO1rRWxXkaJWNKgGeCEop7vFxjJNZn8FvZ85FYI3vPa
	o2g+jHKRujDjB9Pzj0QfT50/OoejBowHTsYWC4kYyyUHuqpJJO79OHer0BLq86WymI069lbBIvp
	mnLV5bEzAFH27NAvo4POdKQ==
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420800185a.6.1792421572200;
        Mon, 19 Oct 2026 07:52:52 -0700 (PDT)
X-Received: by 2002:a05:620a:17a2:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f29e1748emr1420796285a.6.1792421571699;
        Mon, 19 Oct 2026 07:52:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:52:50 -0700 (PDT)
Message-ID: <40bdd031-1d56-45ef-905c-32e706376d01@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:52:48 +0200
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
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CGYUcjIMSpSvlVhFpCTjMeOSCUKRa7_l
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62ec4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXzUrq7AL8MaZV
 sfvuOse3qKhblVo9+eQnxrFjnxyhK1iDVLspuHDt3DCuJHX4mcc0bSMhG7lYcvd3wbOQZuf+Cst
 oTafSQ3E90piYN7NTldM7nfh6gsHMGL+f6s8y041XFoFe3Fsy635fsuxaAtKja7ph7MDg5wXhJi
 ArcGBQ/gUGABl3XHAMUjQrJ1HCH5Rmufd8Mi7T2VG0LV03XdGL1v+QOmAfyEEfLDOpUIw0SEd0p
 YhKFAZUGR665eNSuQnWXoTg4WHeZ9gC8JbpUt+x7pTtX9JgW47VfR3Qfo/a4DSZqt/99j4o7T8X
 1Ut4Wg6eXdoKGv/pflleCzkFRZyCFxJ/P/7WMQKrEX6G+HIqHh76SvktilI9ATxeXQ64f3DWFpg
 Pa3j3RKl8AS6T1QFX+0GSujQX69msXQ9GeJ8eo9VzI6JTiDKBg95C7s6cFySY+b2jrPxc5GeuF6
 DRZxdc7q3t9LaYsNw/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX0gCXR+H7Ui44
 hCzubfsS40CfNfnCPfMpGQas1MrBrOCCtJGru3qjOCkUZxuKd+jQ7HDOuQi2VAb3yESd5vmg2En
 +mxfnk4/WsYbX/wJe6WbG88ftIL2m54=
X-Proofpoint-ORIG-GUID: CGYUcjIMSpSvlVhFpCTjMeOSCUKRa7_l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
