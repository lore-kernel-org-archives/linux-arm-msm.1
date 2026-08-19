Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E09477986
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152464; cv=none; b=bwf0L4UbMvU1Pb5WzEVBds3x2kGKBR5lJIxO/rce0O07/jlXeau/l/TCTUUrSZA+o4DlFxYYOavGiOJkHve6H0KpIVA5bR40/oTep1W8N1pLJdZFTnVC/OvzCcoGtAR0pZQruVgmbb0+2MUO4Hz2rn/rBrUxAZ8qOeqXhwQpm9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152464; c=relaxed/simple;
	bh=XyYLhbjs6RJnhbSnWgif6dbHFeqolJBWD04K/JHIqJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRXHzjtkaO2s3iHehBeUgaiyiO2ei086cvCtRow7J+dTpws5Bnm1k3xvlZmI8fEedyI9QNAs29Dt24k0UwdDr2PT/B0gyu/MnQ3MADQy7SGyQbrBMipFrb5YJA4VaXagEJrzCent1Zzh7zdqRDHndWgcS+2pf21JjozoLRV0lG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CoZsMgKm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ilfOmjXD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CoZsMgKm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ilfOmjXD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF2Flg190716
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gr3SHG5ZcLQq2/LAVZ2du2LceQNS8+jRCVvzfsh42s=; b=CoZsMgKmrKW7vQrC
	HgH45zMS8EgbxezFW7NavHFL1O9EXKOR5FYgdfxT44balIYols3wNTQr5BPSNNTO
	WLQU7IoWscvvvB9FvTks4o+O90AqrMDwOtmjCSVjmBzHageh+3kFPmxpssK030yD
	/RTapXsPMQ4hqa4Eb712l3tmEhdP3GoqpIRwhKbXjqUIxIqaCEoOcoZ5mdsJ4O3T
	kuA7ltzOQsa9soy0wQPJqomp0PxIkNoOBf7PwLMbdDxcKx9Ppkji2ubWU6fMl5D4
	0p4+IHVEeI+myT5eS1jFGgWAmHWBpKjfDLZxzIVdfJNllKJO2rVg8Fl4/bQPmBdf
	8o3Ayw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5esc01ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:14:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52ddb567146so960501cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152461; x=1787757261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Gr3SHG5ZcLQq2/LAVZ2du2LceQNS8+jRCVvzfsh42s=;
        b=ilfOmjXD9YRQ3IexMqgwkG5KqkhbK43iWI+d9ZNUX5QKJL8ZzbNdS1J1hiRxwQtkPa
         nlHKk4vbijUWsGSEx16IT/v88+khrjaV7hZ7IZznA9sMzVvbm0AeVuwL0H79Kz8UjNby
         Jp450nofJexHLVIzIZ3bkpoLQoIxESAe320UFAKO10j+4MW5LAp3aMTNdAGiocU0iy4w
         V057aDyIkLVB+fAbKFOH/1Cla/k+QcqUkpp+3RiXdrEFlstjntDwmbhuKDclfUvUodYD
         g6lbwx2IcscA8IQAPzFUYavLVbuwE6V/VoWuiyOPqaUyjNVs9KcyQq0n9lED2nrBtKTT
         H5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152461; x=1787757261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Gr3SHG5ZcLQq2/LAVZ2du2LceQNS8+jRCVvzfsh42s=;
        b=PtV/uO6MB1KqIX9JNdG8rWZYq82m2T4eJ1pHCJfdj+ccKUwilIfx86k7/UKj8lodhA
         I1JtRDIY9ihN8YhQ9jxThlEeZ3ftWHiHdgwUd1U4PaeAdskfjxZJj+cyrH7CXwejnaAD
         ICIGMAS5b0zKNJ8AwmB2p93gYLlSxeHBwI2OJK/rad9oVdg2DpnPH2isTTwTKgkLtYbe
         UKKleuDDrrLcBhY9ZjsHgsetjGbI4FsXh6SqdpJRFCSt/6EuvujKMoPAtc341XXU64R7
         7AAJ1jLA1khunC2pImyGLjyGJ5rWvB74fHAK0RuVGJkZ/SvTBXBmW7cdd3Z/oxfB4raz
         GgxA==
X-Forwarded-Encrypted: i=1; AHgh+RoAhE1SxfEbwmbL78rZevemLonhkMvv3FJ3Wl++Pl6flbRLVZFv0CoI9J/h6UUxjYjpbSgyaIN1Xpqs87Dt@vger.kernel.org
X-Gm-Message-State: AOJu0YySSwX3qDAJb9PPijyA1MWzLtmSrRMtTCP08Hm6ZykrfwMJbxsw
	PaGAUJP2kZIjx1gbhYCcX4+gAutdOuRhlSI/ljcd6QC2to2g0stZ95JwJGMcWF+iYMzeOMzp3WH
	9EVYEXvc5KdteaTUQlfWxFcyMhxW06UN8wWJZm8AyXd4haoPNFN/Yu8CqZkuPcvA/xrVi
X-Gm-Gg: AR+sD10gk9Rr/77ChgRBYlv4OIBJonuCvpExsqLnanuDwwdjW18y3lG4YB8P/ZYH8Ig
	kk0Iu4DQGVOFgjzZYlRdapEh6diAf1SPvh0hwhORq+3LCZ6JNjMq6uI9Co2u0Jfa8uhbGZwQe4v
	SWac48Cz3HcTQn66XnGTYT6t/iirC4UT8I6EpHJbeyoIlGqipRom1tElbp/Db8MHWZddrXVNCXY
	coFSLJurjoamrfdqGfCa/i/8j0Q2NXpU3l2FZsatl8LoC0nKjqWU1ojjD4OMBCLsMPa3lBjBb7F
	zc7VyYAtxFGjD1AzLynZDbtRV9mWsIyC/2MKF2w20QKUPJr0bZp5YrVXMv36YMul0dhbyCnfT/w
	cDdHXRThSKWPji3yrKOMx93MX
X-Received: by 2002:a05:622a:309:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52dd607a68dmr34228021cf.5.1787152461524;
        Wed, 19 Aug 2026 08:14:21 -0700 (PDT)
X-Received: by 2002:a05:622a:309:b0:51b:ff78:f229 with SMTP id d75a77b69052e-52dd607a68dmr34227241cf.5.1787152460845;
        Wed, 19 Aug 2026 08:14:20 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c243c7ab943sm94110066b.17.2026.08.19.08.14.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:14:20 -0700 (PDT)
Message-ID: <c408e072-31ea-41e7-8ca6-ba6eded00f4b@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:14:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: Add Kalambo CRD
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260810-b4-kalambo-crd-v6-0-744e8ad1dae9@oss.qualcomm.com>
 <20260810-b4-kalambo-crd-v6-3-744e8ad1dae9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-b4-kalambo-crd-v6-3-744e8ad1dae9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9EkWsdMm7DaZOBwxEMBExcUd3dCiXhgL
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXyOcyLMT82UQR
 PpOb7qRGT0Y01tSCkmgIx8UoKIc/nm6H3eo1dE8GJYsP8RdRT8hGKhOkBlOEO/Hg222aYJbmrLO
 gbohZCZSQ57S0IlU7525LuskL56dbf0=
X-Proofpoint-ORIG-GUID: 9EkWsdMm7DaZOBwxEMBExcUd3dCiXhgL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXxZY/8HR/ecri
 fJtU34n3SP8uyCmzbHCZy6qkxGlT35jwxusFkW6QvKXkps2sI0TiTAaRxhcovL04mssuBtP7pC2
 ge7tJOQTDyTLt1HT8Lvk1SjBSxgD+TdKIQk34ZJND67ky1qqfvFl0RQAEcKKtNOiAMsji1CCjyS
 Y2Mlu4qHhglv8EVR7oXnaA+NZfySvSeTb12s6qKyZku5lDI65/WmQblIuJ8jOGA3fYSCjWP878I
 /Q/vQK1pwkV7CuwK7akCw+xEmTaMU9FOPB2ZQvPgT6YL9clxYd0aRPuyymE+xqYsyrQTACMHoRL
 NpX9Z0pwR6UXTgfqXRAZwuVTOwyDlZ61IlQoBY62ud8nQr7Zc3gbVsMx0qPOMXbbdHvALcQR+xN
 ZidisCTuK/ihKojZc7hmDAwcOh8dtL0fwTXVnEAIFQfRZ7lmYIPO+SoJzy6qFYBb22EevxFZS1t
 eiKX0wQ3wfUSS1TnKQw==
X-Authority-Analysis: v=2.4 cv=b6uCJNGx c=1 sm=1 tr=0 ts=6a85c84e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Hkh_rGh67Udisc0sesIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 8/10/26 10:54 AM, Gopikrishna Garmidi wrote:
> Introduce support for the CRD based on the Qualcomm Kalambo SoC. Similar
> to Mahua, it is pin-to-pin compatible with the Glymur CRD. It reuses the
> common CRD board description and drops the PMIC nodes not present on this
> design.
> 
> Kalambo uses the same QREF topology as Mahua through the qcom,mahua-tcsr
> compatible TCSR block. Connect the QREF and refgen supply inputs to the
> corresponding CRD LDOs so that the reference clocks for the PCIe and USB
> PHYs can operate.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
