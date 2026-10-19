Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0AC4A2A4A
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400866; cv=none; b=iETRVvrswQRj/Jd1I5H/1C4Ft+GVjgzhqTTj/3hpFc0iF9H6snb0Bdc6496A8OEfZMY9qJNaaVz6FieGex/LBizk0p2T6myRtwiPd5YDoA452aM7ojrVBZ4W/2nbzoRz0eLMIOKcYdLcjV66mzDSSyXsoU4UA+ZV0kb79E6MeLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400866; c=relaxed/simple;
	bh=XEbm8c7un/ubtexMiqmCilOU/M/0muLc3BE5N3+cOHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gV/oFJ2u8yT6EswIoTjSUGAcBQKJ1bGbhqaQZJG7/W00P6QAE2cKJlMBLvx9lgbXxYjzv/+9oxNXwYAasoLXBKZRi2dLd09xhPviKvzajq8/3GRoluyAHO9hpCBXFxf3NjN5ypGA5WVqbfy0twcF2mkeh/NrG0EWVmwo/DxjjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOvs/ARo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMM78dmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOvs/ARo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMM78dmd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P1eE2041974
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=; b=hOvs/ARo3bMlI9Vp
	klfDUgexlNsMYfJobkIfYmvLcK0xuYIGh20CxVreq9svF7xUc4+QmRsHd1kov+wW
	KY38iuAAS4wb8daIdU7Qz7SV8sBGZtjjCp/4gormxU3Wkfx3lT879CrJn4BOzhKe
	CGUTTaQflK0oiadZBaHKZlwGsCswV9d382k0ikKPvAI144RRS+OTwWKGIIaXHwRr
	OiXFLvBoqv4xTmk25v+qXWvbKmAkxWaLNY2F8xPEsDTk7XPvvmRWhGke+XdawqbU
	BtqxY1bcxWFUAm2mhp+ZDe4LLr9PdhUoOGzE/wmIOxZF7Qivq7SybtY/aUPbmvkf
	78QjEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1xy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so69861985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400862; x=1793005662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=dMM78dmd77JUNZVt3+Hr4kwg2UDxXEqzzNGivwjXdCi/P7YnplB5R92mIe7D4Y+XCl
         Gr662vl9woVFg7KelHmSc20gKN09wxRIWR5G3lcQo3sjGSNG3A0P6tQPbDDbEwl+5g50
         ybjJdk+4cKSks35nwyd/xj8D/ohstTW2YMdfpaO46oqrhImIldyW5oBa6Hgzu2ZvUNxf
         L4wB/+YLU2PKeCTlUzUAO1Py0r+iivzXfkUfzuJ/4Bw++aBRQax1fUMVwXV5FOCP65xo
         4RTVDnY0EJnqkl93IpTMRqrfR2NR0hrwo8VLQvpjBeQpPITK662YbnU1ttl9D95q8exx
         zZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400862; x=1793005662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=yoVzwVBfa1OfPk3bA/PL5wG3AWEon85Q1tHS8mCpt9JepoofGZFBmBBN/QgsR7J83c
         bqjJP675HFBonme+woJTU7bJ9tjDhbNj/YAyJHJjLCQffpm/+GWNSsanDYxkq9lV1Kz6
         2LFaNkqqAn1+fV9hFv/uz+y0jUcBgLb0f8Ppiz4QxtLbC2mP+KSgLYeyVn303A8OYjfD
         6L23rDI8hVktUTSUagFOrckinAX5Z55uE2vLt8ZMt1MwAAx5k98qtL1d2XGm3mASzfCB
         1bZg4iAt053IIjiwg2Qoa76XdILbZSDfIT4zNOxYT2ZXbKABTduFHMkrtYT0phRsgZ5h
         tYaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzNwHqjfjXU0FPt8NaJIIniX4oH5LKrU+s7iGo1UlSRYnZtsycbnsn/O2O1LtNWpVqrCTEXC2z/9FTa4VW@vger.kernel.org
X-Gm-Message-State: AFq9FYJR7uYQS/Vr7kdptwKHUDD5XePi0Q/tPrjOjfrrTu5n107ZljRB
	b+GQ9bUYtrclYRXpeo6TDNwobLP/f1hzfocht1ycxuxHib1E+a/y5KLVqyGEq9RBilrxh8OzzYw
	I13QPARraYXcOpJVFpg6UQmiVdnwnY/xrFZ7rX9H+QljTO8e5WEpcIx/oLskquuagv9SQ
X-Gm-Gg: AYBFou1s2j4FD6aYNMkLcU/T2tNOUkChe6jotSB6EDySFdedYT8zZk4w/DEp/gi6r7i
	PhaKE71FM4Bdg0/Igs/d/IsURIF9e0ean3Qi5z6oHFFdo4jlFRfdZ2Lol9hatupStgZbaj7hSPc
	vTJ5AA21Qeoap9t3iA8XvfRp+KBpTqKBgn0TwjwZ6O0rBTffvhUYb4ympa+6cioJ0BhWen8lDY2
	bJpfAgNL+K8Zr0Ajtprt3L6y+rz7hd97jyPwCfKZcNdei/aqBBRCshpdLIvLHbbsbqKOERk1Avd
	PUBgjDY+3y8QyIA/CJ4CHj7JAyx2xmkzOAHYXCeuQ6Aq/jdhdIzlvCjIG8VZR/mug5OjMNJEjdV
	WG0N+al6AKl87ReZ1M+PeNA==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351061485a.0.1792400861890;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351056585a.0.1792400861324;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm324440966b.64.2026.10.19.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:40 -0700 (PDT)
Message-ID: <d7acfaf2-f416-4e83-85c3-c30aa4e6111b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX8saZ9HMeU6Ln
 owykvKqyqNJ0yVgZzPKxwWiXBnCPuDBcVC7+OWqGQZDoxXdRBTEKp3KWM5fZMViRT3JYjA3jS8V
 6gNFjNGTEPe29+NTrNWVfjy9tUjzA58=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX4eEOsThEQlwh
 6kei9O0rmYEixahLgdNmr/83cSHoETYY763tgcWejnVUK2aVIOWEfAkyHWcaj0GSDyl9GhP/kHK
 JV/Q/XONHonGbrcLKT96efRC8RfL4vUT5qrzmBs5gAwDLYHmCXuREmy6FDjZTuiS7l/SOddcYts
 hS0mIquZJBoGuJeEj1SBV1JGirjyRcFBe1R0WE/tIUmvF5V3VvMr/1cdnkVQmK/i/jQEAk2wneQ
 jCczVY3B4FdDBcV6UDy9DRAvWCIgynGF9M0YNg5P20bk81ZxAPsITL3qqcrjIwCB66ouIJgAGOx
 j3yN/6yv2u7fN8yzcxGeU0SEywViEbc9tcHFDap3wuXplOqNrpq0XcQidkmYoMi0vD7nA09k2t0
 SmWG98sqsBEOZchZwxv/wU9tx0h5OhaCyW7lHNW5Xys7KH1uF/5eftebI16U3i6GyQ2kVkssDAg
 VxBNd5SKPsTuSBYWwSA==
X-Proofpoint-ORIG-GUID: LKfnqlaClWz1lO8OuvS6CL0RyuxZsWNX
X-Proofpoint-GUID: LKfnqlaClWz1lO8OuvS6CL0RyuxZsWNX
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5ddde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SFmIH4a4ZRYK_P-DvPgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
