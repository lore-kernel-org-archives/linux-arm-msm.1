Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408157;
	b=dgls1a72INqfgC/5e8lHoh6HGDFOwZ1awqpGzIOLm7o4XFpscxQwnIgECm/rgUsKyxly
	 YRCG68bKH52tCioMeqXAPWvbSkT6hgLo66dBoWIpvqJpYMjM0VTOFjHXij9ocKHM8s7Dx
	 QPq+RPNiC4IvSIe5Ar/bWlD3f9y/nXxjoCfiaVpAUTSG6DDdvQkCxYE0/jGZy20v7qC4q
	 GOHczzaV7IN6oah26xp5D/ldnFfHqEmTYehu5n34Kv10gi8/PDdFJ52q04Ssa6M6aoVzd
	 HSghih7SId3XOf/uxnayF85ZDflPRSdOHrTubmPggWcs4LvbopTWno3k7DGtrjrGsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=;
	b=EIuzujVdGG1OsVMn4pOVIoWEWqaKp/lclirvJK+606leyYoPdn9csMqFTeQXpxp0IUnl
	 yxAbJGGPW0U7//VsOOMfC5PiG1Yt1UYZrbWhPkvrQB+wo/dR8r2EQkCBCSXPiq558Y7Mv
	 UD938Bb622XQqfzMs4bjytlDpgkMX0eHqtvEk16Yw1kPXsgeDTF2LvJ9l0imqGzMqGYue
	 NxCfgtOEAkYe9XXmMm07hL/e0pFMsF4c51tNnmPSD9ArW263cEHuN/AqkZTVZMImaGUv/
	 SccxuiBwhXTyj7YlbTCeZQMGakTerWK0df+340HXFu2YOjWSOy29nxIFCtm1dY0Ltgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDsyaBpK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FdGT3CV9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF846606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF846606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WDsyaBpK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FdGT3CV9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJFk92223723
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8yGp2EiF3aDCnqlqi1gT7jBA
	nRSA03R0R5GenYCaNDk=; b=WDsyaBpKuxyoqXbOhgBk/TLIAtjDr8VyshohorLn
	P/XrvR+OcvFDa0NxXZ+PtLqpiPq0OAJXSQXGj306O1Q5aa9ZYVJ/Gh4g7xdHlMdk
	sUBGEdpOT0W6/xmM4yJ2yxTYqCIn7cxWqqgfAc1jF04K3U/m7D4ToueyeyG1NP+x
	QAg1bbYXiNTesjWAdNn6qchCZ2e1lusP3nrzlPLKArQ0peiBYI5vq7+thAnYk+mg
	KyWcu4uFHcD7CkdlCPyTaBTQFKAVIS+DnaSP6kXWe7KSboyBGfI6476B11f6oyU9
	JV5A6HLIpxtWcxMgjbGmpXfU6FcXBVr9NTTtewCi12qcng==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh34fa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:42:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecb636b587so859707e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408155; x=1795012955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=;
        b=FdGT3CV97Ui6DreLWIHHO59EOaupKkZmQuoQ56GB66qJk5SGqVo5eVTJ7swoExT6uc
         3QNuQelJnW+7NEnPKxLVu5tPAwx6GOAGnhD/CB9o9q+q0IsPqOoRx395OFUyQsRdFuc7
         kgSkvEpPPoDPZg1a70w28p5ikjY4WDBhOdSS/Voc0oxbNWltYysF/DU+xFhaBRTuaAkH
         9T2fngYMmBvV+mPD/HQs1Q+Q+ftf5G66lFjQ3Mm0diQ4efgXjuYuPymHLaOcgo5L9ZBa
         bgBiAHymbwOEiuomt7kgVYxyckLw4HfcPT0y93CZdbAXAVo85yVuueg1+ySVebucTF3C
         MppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408155; x=1795012955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yGp2EiF3aDCnqlqi1gT7jBAnRSA03R0R5GenYCaNDk=;
        b=QZP60QTe0smzD/Vn382DCny8kJO1lx02onbGbTwBsqAfpKIikjMguQVHJRlrpTtxq7
         0Qx676bmoQ8uJ48zstYcTKNIT5ULtdKW48SjtLurH/vkRmoSN+ghLUihk3U08vk5iaT8
         Tc+71YQLymGoYtR8qeJvqnXW64+er9kgnxpQ6eBY1+sXGikoGNneNS89HBcJPBXsp1Sv
         NWEBnBcUojOjTXMHTOgQaxC/LJxJ1MZySCm53QfgOI2iNG9IupOjSBHoMJv0atbLsXT0
         7z5m/2CmgsbEGYByTX8NJ3ox6EPtWprIViC+xymYV3R17g4xghEAfwgQdXI6obG0vTG2
         2QdQ==
X-Forwarded-Encrypted: i=1; AL+hErH9wAciiEYmUmXZSX8JD5YvqRDTrmdKU+hVF+8sNEFy9Mztif2CW4jhY+lMSmsWlO9dF0qUucs2pN0OzaBX@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bqd+BhhkBkO3iRXHeL1zu94SsCNsOicxpSl2JlLFyVMsf3z5e
	sPleFEFAlueyMFendp0GP6G5VdRqkDrHYoNzDjjnbr8jfyKFL2y2fPimBWardSCccrTBLab1fev
	Z17VAIEPYM6ROEQHYuBhZbVT75aB05p/MgxO/1FO+8K5Dhk2KjbDABcZh385O3hMsOhFS
X-Gm-Gg: AYBFou1TqAqPp4a1mK7Pl7QXsg9NRcPskSD+Ts25NZgxm0FEZG8X2FslMld6/P9Nha/
	Rkpa3qQTMRQzpKrKiYmOXUDe7Z+9qqs9+HVyyEcZBjZfRVAa/myapTr7PdXSkGKFlhhekHcE9Ot
	n5ItOPTVERw/A6bBZgOL+FO+LY+/YO3/xkD7wOBnAreOoVYA8fXqlLCuZQbjxp/OkbULuL3xM5/
	MAzvN6bf4Hf3ANJKuyd6/DtkdjEdN9c6f8KOU11bTwzlFr/YFutRK+rq46AZe+rbZSCaCVDY5d7
	43Vs10FOouNstczWcDu7OmuvvK+qLOK3M+xOxsUz6t0zjvpdMYN0UYFJ7eGcbCFbZDf61/72/eI
	LWcDsHQg/uO0JYTjpTpH/mRZmKfvZ01Gqbgd0fzuHCqpuseuVj3K9uhfrJ3+Y8tJn
X-Received: by 2002:a05:6102:4193:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d50610f07cmr840872137.34.1794408154900;
        Wed, 11 Nov 2026 06:42:34 -0800 (PST)
X-Received: by 2002:a05:6102:4193:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d50610f07cmr840857137.34.1794408154202;
        Wed, 11 Nov 2026 06:42:34 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5553casm721825e9.14.2026.11.11.06.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:42:33 -0800 (PST)
Date: Wed, 11 Nov 2026 16:42:32 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/7] arm64: dts: qcom: c630: Enable DisplayPort alt mode
Message-ID: <ctgojjsmfqlc57i5mj7vgaprp6okjp73mr55bmq6og6h7t2r7d@zug7c4oy5q4l>
References: <20261111115303.3749380-9-ardb+git@google.com>
 <20261111115303.3749380-12-ardb+git@google.com>
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
In-Reply-To: <20261111115303.3749380-12-ardb+git@google.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX2/J4B5YirSnR
 98MOzzP3FZ6m83dQto2WLJayyvgsDdWn000lFcSWb4vGO7oBQ9YHrTqQkWbkj8+yB86nIC1+fzC
 kB/YaIM+qs+dCo/DqWTwxVjL2dhKpjs=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af47edb cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9zJdjf2rWlLw6iGwOMIA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: WgZIDXWJt_W_HHtwNKhF7EOzkfzSAQnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX4zROxojuoem/
 m4QjzQuaJ2+KwmRw0y/VZP+lS4P0MWnAHGE7NqDMDMrooIuSBGAQxspImBgDhucgc6M2pV9ws4h
 XxMmo6A9EtD2f7qIoXfFaWbL5AduRG3p8nBBgcHkSoIN8W6mfEC6wHtBXfW9ErgasZMV6PE55Cq
 CW5afvTZ8Q2wzxrvI/uZ68AI6eb7HdZLfsG8Td8wQ8OKdR6pv5USzrieAx/C3kJ1K8JtlpkKTaP
 bXQ7AL/ptvtveA8a92W2hdtLvNvR+f/vV6RyRppr57FKkq7eO9HdsTC+dcjxJcSrhzf+wUWT8Ga
 adsoYEGnZ4CKTzGRYPj0zsa1t8+Da0ftV2/OrfsFVzVsyx7c/3nisX/lzwl8mDsueoV9WBa6mZ5
 CB18xluC8vuZ8z47fQjnimAxuyZOPztSicnEsCRyKELAQKaUxJYj+8WeA5AAleQ4yVprc1lYuo5
 JZWHDJEu6w0KFVGadjg==
X-Proofpoint-ORIG-GUID: WgZIDXWJt_W_HHtwNKhF7EOzkfzSAQnn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110058

On 26-11-11 12:53:07, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The right-hand USB-C port supports DisplayPort alt mode. The EC takes care
> of entering it, and ucsi_yoga_c630 already sets the orientation of the
> combo PHY and passes the EC's DP hotplug events down the bridge chain. All
> that is missing is the DisplayPort controller, which sdm845.dtsi already
> connects to the combo PHY.
> 
> Limit it to two lanes. That is what the PHY provides alongside USB3 in its
> default mode, and it matches pin assignment D, which the EC picked with
> the monitor I tested. Four lanes would need the PHY to be switched to its
> DP only mode, which nothing does on this platform.
> 
> Tested with a USB-C monitor: 1920x1200@60 over two lanes at HBR2, with the
> monitor's USB3 hub working at the same time.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
