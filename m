Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794237135;
	b=Ze2pGCGqK5aVeQQjmP+q9ndlfWIapV79dWvs+GEIo+O0CVciP1yBYFZimw/1Hxm3gvd7
	 ClPpv8VtSYcAJejjutfvdPk6riUQUEqlx1qI3y6xMUJdW/7JJoJDg4HAmrdv9fi6j+q0a
	 ghTN+AXVxqi7COk+74LhOOAON4PnzdieJU7aZh5G8canq0YDAVr2gki1si/6NHTAilMr5
	 cASsnhEn9BznIfVpl0Jr7zWle0FFQqtC/ws81IoQfXi2bAJ46I858NUQJJlTywVDfi8iM
	 xt4pbIJZe1pDY1i1rLcLfYHGtRljj8VW32hPXNkBR1qjVppd0Upi+NxPcMM4Q7CmVbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237135;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
	b=ozvdzL8oW+vwWceLuUPjLwuKj+uHlSUkQEmqwcpMbKvh+3JwSu41cafC8T/MwZnqCOL1
	 IsgCILGytmPnW6U99icOG5YPVuGwuzrHZzkQWIhbMGwfhzTlinCbmFXoXKUs8lupg3dDt
	 Xu5W8M61mP4vHO+gEfnbsXa3CKLXrm3aHKJEn7ogcG4I0SxorKFMeGz6CyTDTa3n7OCnk
	 TefPKqC4MJlOFr84uPyGT9QdzNDtsWQ5cBJ0DhbBz+CzIQ+4JOzWlhRiOLgt6mHLALlGn
	 hVdlV+xQpDm8qhFAmKJcwKOir1IZosTaEEpWU43d8LbLiOGjek0hWEpxbWy/Y6KV60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62B606A32A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F62B606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JVHA+WmS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIrSQFS5
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFUMD023169
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 15:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=; b=JVHA+WmS28WTu51A
	alo4QMvr0WoiXI1XjKsBEXyVuK1q94o60sR1tEhkiY2tviOamIxSXbW2e4SvWI0B
	FTkucu81+2EXGVGJ5suaNaLkGLtqVzxKWtq5ruWvOOwNBDZI8/88FOsPRUA5JBHv
	JACpPjvZIITH3FJcqZnm9Bm/J0R+cyiE6IYGLJFK8oO7l309Hp1OjCX0HhYMm7Po
	btMjZ1ALCHvtYmQq86wiBt9nEtv5ydZzL5OQA1dARTOb2/BpGIxuc2TxWsSA0U8s
	SRIa4+tiSHSiIPRLKDBLsxrgw25FmtzCpVrDJlCpin4RqaRpkTqQZu+KTy5h/1ec
	MSZ0kw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydgvqr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 15:12:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc0ae52207so18550137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 07:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237133; x=1794841933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=bIrSQFS54jIdF4P6guxFfiAzGIywaL3HcI2CYKiZk5KShXVQ6LHaUI2qAuwOyPWpRw
         xzfuvK2o0r67SnIflhrl9zw16CC67EqRne8OQFuU5E3F2mnYa7/4IlAf3C5Ho221FobL
         MUwgyGtBjh4n6LF/d9m/JQ357ZnuHtLaD7Cq1EMyjDyZfTd5B+EhzTgX+uPhK5gG6Ftk
         iKdSSKA+NDnD/Ck74XrYb7w0tldFtDH471GRhN14JPzJrq4cg6ae6XdIVK8uI9S1qoOh
         fa2WzJoIQKQpdigRZRTw7drea02PGQV8R/jN/nPrkpNaYuTnO5sCoXD++Xie7/gJLWME
         g4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237133; x=1794841933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PUsDu0OkTgaKjQcZBPcirXMHnRarKrGJneMxp5gNekI=;
        b=t4Vbkj5rSRVPOIEpyA1OgHzwfIQ/um2MykSRVHZFjf5vV47tWgL4oIlu3uF1PxAApw
         wbGjdxl+80DfB24XfULtpiNQz6NWc+t00Yln+8BGZF+JSnUuvcNVnJVDtLhi1recyDw5
         cqtBLRA9IeiK0Gs7+rP3qoiPSvwCG2juRlAVdU1VzVxtQh3boUKoaI1gYUcPTucJdWgh
         gseA8YxUbz6y8qavJTXKrg3Sn742YANDncxPVdz/T1d4J7NciHJuOtf/hW0Aj7/iEl+u
         33g33JHCtJN1aC4HUwhvPgiYF6djs8xkwG592R0MVBOQIs4j4SQkSQSMk2eTOwfqASxC
         FxLA==
X-Gm-Message-State: APuU4Z+eXu/c/MxU2ZCLKOg0bIef6MEvJ/GPLIEss2wWtDZGl/AxZfjD
	bqpHDPUPyNddWcUBVwD3SoK4l8xqerHfltAdXWYm8BLOIpTL98IHPInC2BJgFLKJKaUN8Ogpk57
	xJlE3gLioeE/AYOLQiqPN9d3mdkqKQz4QUrPvt3upuE9A+1qf35xD/9bQr5wLW9JYzeuS
X-Gm-Gg: AYBFou2riy14Z2LvrO5ZR0nxShmnvqJD8psqwmlhzoSkXYY4seDsojXdph0leVeVZ8k
	KB/SZyA4f1/W6935OAxBEWJTQ/hJfqpnG7CVkGVC5+U20DMGvQgyBcmkSRDbHgRM8sQCY6balT1
	BFsOm6mh3+JzMTdqdcZ+5MJV/kfiS8QatLs85tNBisNX3W3xIkuiXfgEOARx4ZJ41xjN9BjtXQn
	K6MDDK0wavz+wTEoT3z536rsPz9Uo6QirFOcekDa9L9o+VlaoduL8H9ZcBAjEvSImhCdadrmpbq
	ZJ0dTs6cgXr500EuHnrJUuJ/0rPIS5y2xJ2CqIGJrNG306mhZ5qhy755imPtX8cujPN1OX2RKUM
	Y7iuMJC8zuvjyio9nsLYmvkjXNzCrzF2+x+xESyHCkM+RjLpR9aw5tawEARAW6v6f6vy28A==
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229132137.0.1794237132537;
        Mon, 09 Nov 2026 07:12:12 -0800 (PST)
X-Received: by 2002:a05:6102:301a:b0:7cc:1137:9d98 with SMTP id ada2fe7eead31-7d2da6343d3mr1229073137.0.1794237131982;
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ed95desm1765456a12.26.2026.11.09.07.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 07:12:11 -0800 (PST)
Message-ID: <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:12:05 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXznBW03ALXBr8
 G56cK3vOvZpSuldNX1+5upAJynlpAbRFjNmz+Fs3vFysR8RYg9L2J8p4vdCYF2NO6xq9PwNOjkI
 px+m+X3pb8s5lJJ3F3sBz5zjkbu8Pgk=
X-Proofpoint-GUID: RxRrZ4nI9pDxLNV5wQlZqQsS1snYEGrD
X-Proofpoint-ORIG-GUID: RxRrZ4nI9pDxLNV5wQlZqQsS1snYEGrD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfXwH5gmfrwNb5Q
 xd+Law+PKVWydIOSm4sKa4//DXVLsmPVU1dlvZGcP5d06WgCn3DgntnBzUAUHuXFC19iqcMgf9l
 kMkw8+lTa2hJhzqtr6MI8rDCvJMAE8Am0kMZK76Rq9gY4Wyz3y5BF83tNS3tPo5A4ceHXOyNosI
 epZuRnoch46jfsWBN9cqFxnmNdKXL03dgylKksSPXVZGqjKbQKkprSFds3P2UBolq/4f0e+3Id3
 jqnqthcVPpTjIZvf/fsA7nybpjjvkLggXNFSHYui4s+OmY+7EIpBVPrN8VXuGs+o08wtpO/S8x/
 cLkU0z+ZvvmxjomAeS4QR/785eSllBbUoXIzfihvM+MgscRIACoZe813gyTj7H22eoOqQ249jZH
 xKxZ4kUSh+qcOncP1Aj4FPJAOjxhCJyB7sS6joj6EvoyzN3phV3rq+rnY/sUccfqV2WcxoQ44nV
 sT+E1gARaWxl2a7eg+A==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1e2cd cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=Xzw-RmQiYhs1fFvV6_MA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090060

On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Samsung Galaxy XR headset, which is based on
> the Qualcomm Halliday SoC (SXR2250P).
> 
> Supported so far: the PMICs and their regulators, the power and volume
> down keys, USB in high-speed peripheral mode and UFS storage.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

[...]


> +&usb_1 {
> +	dr_mode = "peripheral";
> +	maximum-speed = "high-speed";
> +	qcom,select-utmi-as-pipe-clk;

Is there no superspeed / dp altmode in hardware?

Konrad
