Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF8748640B
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401165; cv=none; b=mcU2uVX0iYqoYIBxQluon4GXmFnya2Q7IIKnwbx56aEiUgC036JWRj+7frn50y9xbreo+/yIA647WFNWea3wCg8HQmLFsBC6JAw3KXFuat+GRqL64eCW805fqWVzpR67kI1rSmy3r8C4tbOloduIDpbnMOOGcvsuXh5In4BlLRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401165; c=relaxed/simple;
	bh=HIk1IpHMIoS0JC9EwLMBzSzfIUXCdtc0LgtWZRJBnoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oC8QLS3PcYvR0HGdH+Dzo7VqH70JKlvJmrW/mCYth7+gZF/ALabvKYY/eCRhqZTUI8I5XCCcdDsNV47HLeA+jMHOlLFUbweKS7TbaWCFuK7peq85s7wTb41Y+RQh/7ubVEX2/Ld5GkysoKpKqMLT4ZkVn1yZI+I9jOYR3IHaXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JpKZIH2f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iNp9hj4o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JpKZIH2f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iNp9hj4o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0b263588221
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=; b=JpKZIH2f9DAXQmXH
	2iSP1VdlpJ0jceUw4F13wvvmhwgtDHYwagzFi0IhLy8fWf1EZBTsFWgxC2NtF+td
	1WB37/06bpqcAzlBAvfooguEFqC49IGSvPVLEjjDniBT5Wk0wufQgO3pvEHhA6DR
	vzmq7nW95tq33wdbJ61049JaWHRe3zZQo9rYHgZSTB3t9nBRWzVB7ZtP/fofSiWi
	e7XA9fOcoKAvtOLodW3OMJ5HOzHr8EhHdSiHkovtecswNEkJ/z+6GaUfDWFH6tn1
	lLDJrJtF4D74EaNcKXw610/z4fDiD6TCkV8IMdJyApCyirO2+QUisvflLq/wqhrD
	t9dkSg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gperg9eyk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 15:52:43 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso494660241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789401162; x=1790005962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=iNp9hj4o2AzxqjBfaNc5bHa7I9iqqp+Rw2H1NHRdqhrGcquWfThpehw8rPqlq2MLTL
         0P48a0Y80wjzhikYeHFNvj46qqX4mIP7HAFmh9I7FUVL4BtKg7GjNcdyJYHHMzZ0qulD
         mfSx41fgQL/m50tV94wl8t253qBLd0Dswivz+p9bsidmHRh8rFBefqhHulDrS8Qbs2TX
         KMXSDw+sBiLM/Gmr5cug4rRF8hJL6MniFXc/2w1qz3s2V+MP7YGR+y1HTYN2HdVycpzo
         dhktmN9qoB/sEhh/nR7AdODR+B7dShfkRGD6pL+2PI+Ejw4Szv0Ah2rB8iqVZG51R8Pg
         UgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401162; x=1790005962;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVlvxm/so69i9rBF3Qqf6pqpvc/+LeTsxiPPuQMtYXE=;
        b=YhodRK4UyRPoEofmgHf5JvvSdp3Q3TfjNsP+y4VKLaQ1peb4F3xftsVYh6Qh0YALXN
         7ZyxtRkleJbW6TskpSBInQNrgupHqOTGowXnC85hA5P0ArNBAYxg9LAeOWpK9dYEmS2H
         kFl0SB/XrrfYZOQtTWz2eLH42+SqZpei/YnsMtUPMWbUcWMFT5mVTVpmLEjA21sa+hYY
         MNKYSCUCqAmpLentWHDJdO9P9iOXp+ORZ2L2Jb+jLPL4GgrxiXMcQZx8C1TCZfCW2fdY
         DA6vEeAHWLVaiaTarFV5HTVxsfvEIVM0oMyDHy7p+BAVWWOn9gXhDNZv2i0L0r7iWnt6
         Vg7g==
X-Forwarded-Encrypted: i=1; AKwUvBxGqE7JVnt1QMsxTuE5Pn7WavyGmZtZQeA/mL6aBY0ymX2rFGidVjyD9F47WIMBpW4q854h4Tvm0mYf0XIS@vger.kernel.org
X-Gm-Message-State: AFuF++nE3M7gccof7SZEPM+YN2ftg+6FihAYS+wIKIOCR4z7cLuVJtsl
	gxZQmJaqxq170vxt/UdWZNvyDoYtTwvKMrQ0ds24nwpVTwTkNOaHvmD0DwgfPz67BbukoQNHQlB
	JieFQWZFtGZJmZYvASEKD4Hw0xzv1Ae+j2LZNOglIBXmqeWY2BlGx60msZ0S64GeEVSAS
X-Gm-Gg: AYBFou2zoaqNiisAtjSnWtKC6kzU1W/BK4A5yin7wmyHYYpc3Xw+PRQllZcHUMKuVHM
	fVcwWfJMWnDjenQ6x6PM6tET4d0FHs6MffZbt05jxorMMVCVmzFFz8Ynj43NkSgX30dh81CluQV
	GcXSkZbrq+ebyiQGwFbGEEwPPPHMGLHx1h0+vLK+geFuxT6vqw+Mxj9Y7Senkaus+52cC7RRWdc
	F+JaOLYREseRx4Rn7VgcXZf4l/HOGVk/f5C+dCG9udGaxrl9ujSSnrVuswvToo2MVIpkDhzYmFy
	XSMwBVO7pcJwFVoPJdyaLJxt1TeNIkQewOat1iYjuAfFGtPp0ejA1XMsgI/5eVz40bkz2qMCAb7
	i3vFJBAl7j01SU/jWG9zSzJjJGSB0
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3781357e0c.6.1789401157283;
        Mon, 14 Sep 2026 08:52:37 -0700 (PDT)
X-Received: by 2002:a05:6122:32d0:b0:5c9:72ea:141b with SMTP id 71dfb90a1353d-5c981d701dbmr3780433e0c.6.1789401153186;
        Mon, 14 Sep 2026 08:52:33 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm22926613f8f.0.2026.09.14.08.52.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 08:52:31 -0700 (PDT)
Message-ID: <3bda35ea-1f45-4cc1-af1e-7f1513651b60@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:52:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] dt-bindings: net: Use consistent indentation in
 the example
To: netdev-bot+sashiko@kernel.org
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, justin.chen@broadcom.com,
        florian.fainelli@broadcom.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, ulli.kroll@googlemail.com, linusw@kernel.org,
        clement.leger@bootlin.com, olteanv@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, hayashi.kunihiko@socionext.com,
        mhiramat@kernel.org, nbd@nbd.name, lorenzo@kernel.org,
        ryder.lee@mediatek.com, shayne.chen@mediatek.com,
        sean.wang@mediatek.com, johannes@sipsolutions.net,
        matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
        jjohnson@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be,
        magnus.damm@gmail.com, yongxing.mou@oss.qualcomm.com, rfoss@kernel.org,
        abelvesa@kernel.org, vineetha.g.jaya.kumaran@intel.com,
        claudiu.manoil@nxp.com, alexandre.belloni@bootlin.com,
        elder@kernel.org, s-vadapalli@ti.com, rogerq@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-wireless@vger.kernel.org,
        linux-mediatek@lists.infradead.org, ath10k@lists.infradead.org
References: <20260913122910.99457-3-krzysztof.kozlowski@oss.qualcomm.com>
 <178939022208.22033.14553895731937911806@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <178939022208.22033.14553895731937911806@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8184b cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=JYzT5DUXXbXYkYiThRIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: UkoQBxkCB3tu_Hz_1y1wLy4QxwHq4V-Z
X-Proofpoint-ORIG-GUID: UkoQBxkCB3tu_Hz_1y1wLy4QxwHq4V-Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfX4L2/qEViHJwd
 i3ONNazuzNkywTxRfrqQB2j2Zt1iyuHnVG7aowCR1K0qKN9fV7ZZUI7nlqFn3aB8In9qwydFRdX
 FN81dhVWJIjAqiIbug2Q+KN20C42X0d2qquQlE8+c81ADIZWYkZVRC1GTpZlqVqV0AN8UtlNMmK
 N+aN2qVVo/7QJnAtYBQjphJQIrmLbJAh9HqHptcj617TBe9TlmJC/nA2GTzQU+ZvBKU3+8kyMIC
 KhnTNBMmbwDOe49WZfSlMCoCoYmp0TDIH2olt/kA2z/P9vvFILzLbZYS07YZDGXH5WSIMOslpCe
 7P6GpIvUj4Nwl2IFT7yTU9cJpn1SLjY8rRJaFrn0UdYBxas0fBDNVInPxsVl2DAi7SbRNzLO3K1
 QDLN5NqSI36wKOIUiv+CIPYKD0lio5a5q2hnpelIlyi9+BmZSm3V3siPtBSL6xJ8flkHjHg4yyg
 Sni+47ZW0kEh4DOZLng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIyNiBTYWx0ZWRfXyCYFXUyduCJ5
 MoYjHW7z8u/eVoF5Bt03QcG2ZvAIZ8pMabEwRxkEU2Z4WwZnKQuDXjyoaLy643ZyJgrdvX1iDTx
 tnbJocfZ0jUuA+WUgFRDNi3mcmoTVvQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140226

On 14/09/2026 14:50, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 0 · Medium: 1 · Low: 0
> 
> - [Medium] In Documentation/devicetree/bindings/net/cortina,gemini-
>   ethernet.yaml the patch does more than re-indent: it deletes the whole…

Overly long, it's like use the most words to explain something to waste
other people time... I really dislike this approach but did complain and
people disagreed.

Best regards,
Krzysztof
