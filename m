Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAD4413787
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050266; cv=none; b=ZoauYjzsJbnd/kWfk4cscnPQyuhIRr7Vt+bZA+RnAcEWubRdmet4nQISW1w3bt10gKk7REhwYLj9iNoajMAkQHMdKIgx6Z/c73LfRieZCalDMNSLrD3lfPKlTNAPG6NU9Sq9xGe7B03+c3R/hIxqoc0Oelbagd9s/GEmkvv7APM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050266; c=relaxed/simple;
	bh=zWywIY0qAbAeFlJplePFS7ehWoGW77JP1RrOG65KofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cyarWJGk2QNgo7Q3XAhb77pzFQ1kOVEmSFOCmehsAeLzgv5krnFPfH9zi+dZZ1pOmHdngKpnRM0NYOt7GtAn5Mgndd7PlCzPvwZkr72EKQwOtzqJSkA3sjQ1UnIANPcC2qi+6IngE763v178UOaWt5xd6O1SLfZuVp8UTh2XYbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mAmFGixm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8eI5Zxx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mAmFGixm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8eI5Zxx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABfev820124
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9JH25f5fXHxn1qnWh+eCbHE4
	YhoLC7i8tmsLfYHi52A=; b=mAmFGixmpfMust10ozp2lNPQNpSuemhmHIsk1WOd
	1513efrQy+YmogcAmKXJh00hrmnxUqCD9EtYai7APBrG0N1SWiCzkP7fi62WjTK1
	zgRR5+mGmrjKTG6SPSZjVYIkRJGp2441wynxaruXRQiYUTU7yrp9yXK1fw6/IyOy
	aBlYbM6COqRPjNAm6vUpw0Cn7EFeIFi6TAEu+7XSGrGpxNl17j28AwcxFkfsOrz9
	MA3g8gFyQ8g3S6L3pdX76totbtY9/uVo/mPsEwT6mFAnw3mhVgjvC4HejwPWJhO9
	eASxJYDrn0VSWqtIVnV94F2gsjwq5HfPwc38sYqGXdgPkw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p1kfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 10:51:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so744105785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050262; x=1787655062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9JH25f5fXHxn1qnWh+eCbHE4YhoLC7i8tmsLfYHi52A=;
        b=W8eI5ZxxHOGkEbCxZOmIcUeTchlKTssfJY5iDGMn0cS2bphqD1BZ4F0s+EBSDeq9ib
         bpSxN5C8wSABbYnIyxBbNm58FdlOgpK7L9Qnz3ayULSu7NWsYNwcwXeLmffbW5ibBHCg
         1p36cEsY3z9zBIwK9p4CsmUTSdr1I/mdofcFpCsDw473G3id5BcDa3V0aO3EI9Krqdxr
         WeKUzQD27m7A0l7c58iWa+4C8SVAU+K0c7QhI6XgxxOdBHF6YIwQido+gk7JkiERqOrE
         Jna9HivjIrEZ+2Anr6ebVFFq+ya6OOKyQSOtlf7sKASX9d3elXU4pJPSwxCKGzTZ/f2W
         x7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050262; x=1787655062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JH25f5fXHxn1qnWh+eCbHE4YhoLC7i8tmsLfYHi52A=;
        b=lreoc7nVfpoMukzVGhLSCtEOQUKU2w6LlgimdD86wvRq4MDPd8KCoZOvPosP+Xqx2p
         yquH2PS4YP8e2GIsjLPTthVHTw3fB5+tDjzQlIG2HzuZiq5FzWcCig8nY43rG/FJge2F
         NqO4lLpF2P/dQC9TGvo2hKArQKLCaqCwGfi1eBH/AvjMvJt89NkJDyJGSwa7TgEB61bx
         VGbUrLVzr+ROMRhUi8MTPBpxHGWCLz2PWB/ifigbgLH7fClqfOEuCsR1xP+eMh2HVtv7
         gK8i5iOGddLkaOg8HwxQvs9AlXu7pnzS7qKv7CiuLxWD1TZiSZC7GhjNYBSDfiTLwXd+
         tIZA==
X-Forwarded-Encrypted: i=1; AHgh+RoQBM6awc/LzQrYVXaSQFbCqaSkMEumAGWIhECqqavaCeSJGXl3n+dQ2bAcFcOgX2zKqeFBEWkyThK3vR76@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+wntpwQ4rlMogFMrje403I9RNirwHmCradiJD/zl/zHYYAzVd
	esoLUQnXqQkB07kn48LciL3E7jEzgTdPXF9AmL8R/7D7e9RpPZ1ePROvTW4qaSMd3Y796xNoWWU
	k9AcjHij+buqlJ/a8/PUljHaMnIQbWVNghqwGTfSZZ/5IvTFrmkiPk6NCDG8JMt1wSAXq
X-Gm-Gg: AR+sD12h5vXvA9ljOFxskNBkdyd0n8v5HuPYWypkS/5VOwmEy0whsKNyNYLP3MVBSpE
	Tcn6ODF0wTluQrfwnCxBD68xZYkphcYj12BVwHqJJ1S2Y7NNrO+4OH+PFxiCtrznsdfCeYrtq5W
	ky5qTVbqIHFEMaBA6Lu+CihPTXJpYprLHEX+FdsX8TCVUT64XmHjVt5el3EozvdaSfmMrOlzAEC
	dLlVmWfFydfPU7D2mGSvhUI4c2O2zksyr+YzoA1WiawpUFu/pSMSraQb8Y8tYsWdETMyTwq7R3V
	rIfAkRVvr3rB7s9QA3FztWnuxXEwgNBPYeoODDlk8Dvsr0/ag7fhh6y+TNoDbNylvc1Ntlv0G0G
	EBgFpLLG2kXbmLOw=
X-Received: by 2002:a05:620a:462a:b0:936:e8c0:ef0b with SMTP id af79cd13be357-936e8c10514mr1950961685a.19.1787050261739;
        Tue, 18 Aug 2026 03:51:01 -0700 (PDT)
X-Received: by 2002:a05:620a:462a:b0:936:e8c0:ef0b with SMTP id af79cd13be357-936e8c10514mr1950956385a.19.1787050261066;
        Tue, 18 Aug 2026 03:51:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49996100073sm282369775e9.3.2026.08.18.03.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:51:00 -0700 (PDT)
Date: Tue, 18 Aug 2026 13:50:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: shikra-cqs/cqm: Add Type-C support on
 primary controller
Message-ID: <ufpykzrrejcnyf2hbmjlmayd547uvygh7vz7bs6vygc24b5ydq@ftwg4vuqtw6s>
References: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818-pm4125_typec_changes-v1-1-6e6ede93db19@oss.qualcomm.com>
X-Proofpoint-GUID: HDslLup-4ve-eA6k0J64uO9KV_z3J0jV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfXzEdCF01HoI1Q
 jtOg21nAAsdv6nf0C+bqlGB2f8gprJ9Bm/K94AstlutGPdNXMuOPt37ptfcX/WX5Tnom0z7Whla
 bFq1IFpG074IFKam0O6vrj1K5Bvqm0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX9cn7JBdSZPP+
 k+Rx9O9ZZWB0qPD62QOzKHjpeVmStU//Hfs6iXv2ICRsQg9APKtYFfM0+smA5qLHKDtg8EZAvuD
 Ruq9uRlfMfA3pTO9/uZKdq2PwLyy87ivBhvHl/lxv2taRCmznKUOUz0Ee8binmaeTh3W3yIBDDG
 T2a9oKHKDWUHCP1Fii+HBo3sEYEmAzZsIetecF86phYCjUF/8SSf1lWqTZUT1lSxIwjIbDwonln
 9BsQpzLHICZV/WFO+xYFawKJYngjDF6ljz3DuU/D2H1MTpvBtZwJ9A/BR/Apclgw4w5C9KHTQXc
 qWnwzFV1uk7NZrswwklP2eHZZ2WO0FZTJsR0cuIgh/5r0oQog0V9Yn5VfMfnCgC+JmLgZH87646
 QyU1aPivOherz17LgyS/INXYK2VLu1KUqpTwCJeRg0el8xtr8GePhef8ppxrs4VGCm4mKtJa+Ws
 w/do6lyIBj83/GvfHQQ==
X-Proofpoint-ORIG-GUID: HDslLup-4ve-eA6k0J64uO9KV_z3J0jV
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a843916 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=MWQ5MxpqQmLbYKd5IoMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180079

On 26-08-18 14:35:26, Krishna Kurapati wrote:
> On Shikra CQS/CQM platforms, usb role switching and Type-C orientation
> switching for primary usb controller is handled by PM4125. Enable the
> PM4125 Typec node and add remote endpoints appropriately.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
