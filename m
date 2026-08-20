Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBD361963
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236850; cv=none; b=MhoaQnciikrd+d0XX3URzQBmWq7R3jYRt9J4Je6f3c42JIV6aQjKIVaAKhTOr/8Nt4LfNl/oDgmxvGOvS5N9643i2vpr3OlIuI7l4GLc6u047IfOzjX6B8Ey8paJzP+XUCpCMNZGfv/JF1GUL/HLh/i8S9d3n3SWiVzjmcuBQDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236850; c=relaxed/simple;
	bh=1sdKf3+MjT/whhOkMFC1+vxHGD4U3B1WvWZHKYEUij8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XbOnxnM5zjMXZYrR+AojEy51/ursHe6MqS6UEzxSyL/JEoPJ64qlk8SOYMcCSv/8/ul7Bir2nZuPVz6tF5uBE8xGmGSxSJUQSUln0DwrTTbPNF2aE9HzMS5aXx9j+8g9k3M4moOZ+FGjFUNyQLlo5DdXG9Ulf41IdIAFIaIkZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mmdZiy9w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=efqGYeG7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mmdZiy9w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="efqGYeG7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KE7i953650426
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A585Ucy4FNA6wGjgnUTHLLjQheyU4jzCeup6DtjAm/M=; b=mmdZiy9wcl7+mpN2
	qGQNzI00F+TGvqyOaevHJUjziLxzaLQGS5O3w8asTlRpmpvNp5pM5jNlZO7n7IMa
	4Op2C9RFI2C/ZChutWpzSA3/I43/QXvRoKQgIGjUsrrbIV75a1TpHRyCU3lp87lA
	HWpCS6PL8NvfTUfE0fwEwh91DNYvPKnPOPJUB6fLzyDLkoCvvlrqkbmnBhmEd9yE
	gjzUIcHS7Ir/p/wU2rDonRBFi+bIFsZgjxqHDHJKM5objFWRQ/MPyCp32D4qpKy6
	J4RZ0EVeDx5wsi4pPKO2yg+hnWzcX19y0zN56ZB6gL6SXoP39Ta6HgpDyJ6yI39I
	VC+k4Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w499rtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 14:40:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936cf9b6f32so3255185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 07:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787236847; x=1787841647; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A585Ucy4FNA6wGjgnUTHLLjQheyU4jzCeup6DtjAm/M=;
        b=efqGYeG7RTwEfQ2stpFxEsK47TD4LmnuvD62Lh/ua10nmA2Fgdifm/W+95iSxlomsu
         9iuqyiJKQxfRONQJT7jhKdNF13iR6PIW2P64FYooktDFHnOTB0qFp+L14bBCVaiGnF0c
         mxX5O5Qi+dWiVaK0lTKALtY3hCI+GuH5gOsDausTE5lUQwpxTVK14001e1oMQ1LrQo6I
         QXiW/XXvYp18riP7RuDONzT+32arxlUR0uaH/85hK0Pz7mwXhWSEwCPZ2I86QzUTfzhZ
         rqS2jncMqHLK8zau8r3ar86h2zytK65Mb5FmLOgwkb0DPLJP4o+WM3fV5+nzo6AsGdwJ
         tFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236847; x=1787841647;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A585Ucy4FNA6wGjgnUTHLLjQheyU4jzCeup6DtjAm/M=;
        b=F9lXJczrrRJn0UJsEbC68eBZ159ksmbMYSM7nc1GB7Y8n3VvuL5opyQEexPtNUecak
         pbnjuf5PFUJ2VnIdD7/7PDIgioDyP0RRVfSVZuJzWF8Ui9APAVOaRTzQ+i3Caya3cnAH
         j8XHTGZq6l7f8Qm2t5Op6giS5pANmxGMUExzxfZanFW5jtM4WEHSWFQAVxeQGnBKEuB4
         EY5A68VmziAaSAJsR2Eq8uJFMvz+bvlymgcg5WPmnlSvOxrtMhNu2G6O4Uan+Ee1dB/S
         QVkaKhBr+FE23ZlrDEd9yXckA99hocyRv1Mfa6tD1XkGx4Z38VTODv55jZT0FATyKGQz
         RGpQ==
X-Gm-Message-State: AOJu0YyUZeCV8VbQVLavF7ZiR2k1Cg2/gR+gQA8AePQ/TUgj5WrVxu74
	MjOP+sFWMaYhLspp2D3w/+XtNelmY+Jt1K/nR5id61LHO70KXp7PD/lKR8H37T50db0XAUDP1F7
	w2uLVtVcCkDiS0gRsSUxGHpHy10X+xLiWB9haumVaZh6kdsnMkBn6YUcmDzNLtCwXz8nc
X-Gm-Gg: AR+sD1201GeU6W5Zztz6WuqwFdzKQheOn1es69POFuesa2IpwV4z/gGuCLnXkG/QZ+o
	barUH7qLE8qe+hO3ELNS48Hk9u+iJEdnbJ0Bnd0o+TpXZ67dIoz9SOvMC4vcfG+tCS7ljahFvdr
	Ks5VAn7FzyY85dhQeLwsAnj6CgG30qEs70DFjJip9M6/SVp2DV5f604m0c1y6NJPeQQ5wx8vhz4
	6atyxewL6ZLvfYIojK8gHw353383C8FbuIEfryZj5IgXZJOATcsw74nWSAqUwtBRJdWsCkgGrxk
	mt0HP/VlRzPfdpA5grWV5FhGd+CM7FHiAk1dxtZCxUD/+NgfHjv9t1M/G1EnJ5X9esyfnuPX9iq
	AqmitUkajOXHLqABbtWf6Cx5G
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr821709785a.4.1787236847538;
        Thu, 20 Aug 2026 07:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:284b:b0:936:5ad0:fdae with SMTP id af79cd13be357-9371e7e90f4mr821703585a.4.1787236846772;
        Thu, 20 Aug 2026 07:40:46 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b478860c85sm1334011e87.35.2026.08.20.07.40.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 07:40:45 -0700 (PDT)
Message-ID: <7ded57d7-4551-4f8d-a6ad-1fb52f4a26d6@oss.qualcomm.com>
Date: Thu, 20 Aug 2026 16:40:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: geni-se: Widen fw_size to u32 to
 prevent wrap-around
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260820-fix-write-to-read-only-firmware-buffer-v2-0-7badcdc455fe@oss.qualcomm.com>
 <20260820-fix-write-to-read-only-firmware-buffer-v2-2-7badcdc455fe@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260820-fix-write-to-read-only-firmware-buffer-v2-2-7badcdc455fe@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX4HoDifg9dX1v
 aWAUDk22wuw+BaI46zIbe3Nf1YzeRKMGgFHwEuerM9X7MmR1IZW3jfnqaZG/sw6dAFlNb0fFJpd
 Pu6psQCAxlPyr930RhGNix/iJe/mM6E=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a8711f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Is_EbzvR2yVdaSa3ks4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: RCYd3kdZOD38pZRA1oMZS3DM1-8qlcPN
X-Proofpoint-GUID: RCYd3kdZOD38pZRA1oMZS3DM1-8qlcPN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDEwOSBTYWx0ZWRfX0az8Kx2aTmDz
 LV97qT9cL6pwrJBH7io9Na7DZVDT5tl9weLCngw7AYcIA+F8/f724DVMKYiSFRcgTjc0oGB60rc
 25zA27gVGvVpF9nDwIJxCPMPiLDx0ssXrgQB1DguhlTA+F4oi8x+sR3Vr5On1YEoTx/uuQQ7SJ0
 PlsbufjPwGMlyeSZoDeN5vgvc+mZgDFVeF2ZtAKaUfZTJi1ol5IAJ37I7vmrI8o0/itCXgUe6/V
 99oZvqXRZu7xnpS0BUzxVmpojDEIcsfIhpFrS3npGVrPndTnrPmtwHRA/T5qu1PWoHqqXtt8kcK
 d1zk7wJD1DTzmM7cSF98IlP/ulgMwOfz9Xz9QI87ARy/NXhwg2QLK4h5IkR5HQ0Pb1A2blAsF18
 H2T4ciCCmvnpXCWAbwc/0R2iIqAYVLPkc65DVPmyE4W39tUtHRQ4aE/qEaBeyAUTD7gwemOASIq
 sW/DQQ8iM3bOcbHK5FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200109

On 8/20/26 4:30 PM, Viken Dadhaniya wrote:
> fw_size is read from the 16-bit fw_size_in_items field and incremented
> when the count is odd. If fw_size_in_items == 0xffff the increment
> wraps to 0 as a u16, making the bounds check below pass for a firmware
> segment whose actual size was not validated. Widen fw_size to u32 so
> the increment never wraps.
> 
> Fixes: d4bf06592ad6 ("soc: qcom: geni-se: Add support to load QUP SE Firmware via Linux subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
