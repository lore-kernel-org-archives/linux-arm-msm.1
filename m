Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5135444604A
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786456173; cv=none; b=knXlCqDqjJ7YL0D0u/IeNTamtfB2hJcCL9M53z5UxxLlp0+5SPyix9NrtB5WrZ9+oHn4QRbL8CI2H5sOaXV0uZe9LyB4cwWkNWl7ii2yHnf6pJPELzQMKBF8uiXdqq57UEmUp8HhIk+VZcUnp32Z5XWVGzKLuVumu5R9bb0HdQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786456173; c=relaxed/simple;
	bh=pI4OvKprw/hbYM1XIz14+vf+2HgEi9aQYZ5fqSZJpqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsNOhj3bB3JRhPAPmmR3UknntVzpZEgBAcPNu7QNtKRJXD5eco6imr6qTw9ksryqZjf/4NaowokcJ6Sw5E75XTqw34gdc+MSwb8VPMxX+beCLIOxMPMNJgCUIE5GyBwZAsZQ6+AkRm3At+/teaL2PI1OtwAZsXmtHMO/DbPhx3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xsm4t7Ed; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkuYZVn2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xsm4t7Ed";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkuYZVn2"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWfxK409870
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8/I+35oWb5HAzTxG1yfTDC3B
	FFh3qtmEzI7/MYNqWK4=; b=Xsm4t7EdPi33tyaqwPkQnkZV+4t4j5NuWZuqybUr
	+EZRfGziM+kXAfLLpE64cUPuis5zq+q2I5CbuwIZa6bzqSszz253YIg6xxvQCe9k
	uZ56REIOsUQL30kcHj2DMYfyk6wumcSVwg2hiVj1YAtmHfs1lg9K+oo9f2nepVtq
	W6WQ2Y2OUy6IlyJp9n2C0+RDbe3E6JZQ5HvAWZY6vLM0jIBZQjoVBZ4LLmFkn3hx
	NHx7bcJ58pyZQsUKSDuVLJfCDY4xwEd3tbAUsjBfyPQ0m2frYQoqiA7g5CVlOqYs
	L4CHRZW9Ok6iKfUYStPQ1p1/3WjTKBakqJh2umtwf1iEwQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyvcra3j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 13:49:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so67030501cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 06:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786456160; x=1787060960; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/I+35oWb5HAzTxG1yfTDC3BFFh3qtmEzI7/MYNqWK4=;
        b=YkuYZVn2/jt2/mFKpj+9kaIzsw2UUAgHsCdb84hSAVyRO+o6uzNRMB9kkHa/+FMSMr
         4e7VyuCILQaqWyvvewuH/bLEmaAUyEWcoGsUK4O91tY265rpFlrgzrCaG/HKBwC/g22/
         jjU1ciicwa0xaYRdfPryCzzgjIF/l4VKoBIuYHx7EOYMXoLGJMcGG+H1iwoE0BV7raCQ
         aMrhKe2NP372FuOMf3rd0Rzq2NHzTUBBHSELDmLNuzbAkFbfdXaFZXBd6Wm6fwkqwnD4
         UkWFPHQ4Vh4e5LrFH2cwdEICl2BeYSdRpB+Ksog3aDGCry75Wel/aAldPP5JiZSnhwgn
         Ov1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786456160; x=1787060960;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/I+35oWb5HAzTxG1yfTDC3BFFh3qtmEzI7/MYNqWK4=;
        b=MGKzRx2BbI+jmRYOqKBNfBGRI3L3yYeciXUmKZvEjhukWD2r5Pi3QbsF1j+JU/fgZM
         GkiWmwA6cItAfaH7N0ky0TwcC/M1CicUL3U9VpqWbXNuVyXsZOoYNIi9gnWY3GKCvgLn
         o1zgxNw06WU+L7FqabPRUPv8UJBMVb6yqJDqKtweMP64XBnqN4wyImpLmFKe/tYVdZxP
         bnitvjWkwfYm7FEsPfLkeL1eEOmOjTY7o1cVJluDbxeMEhNoVp+HELy5H0Kv6yMl6S9K
         g4+IUVP4IEsvAAk8ufA+vPxU3YFn5Uv4s6ufeuzuryqWGGV2w71s/9x/14eOQAAtRg4Z
         x79Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrn998X5mTm3txoabWl0wdqIT3Mvi4SFq9nn3BsJMpdP21es4xObC9Hi8Tzwd65V6rY8YpeV28TJu21dJmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz7Sb+E1J8R9n4VpchmJR4vODWqfCSVvSvxL/h1iGXErX9Ay5g
	1L95n0GBc2G1gIng8dFAt5dTI1mZSPq7NW8EK5Kpl7pwhpGvZwHibn6j8/OieIMlLM+Fx37yIHc
	80O0ee+k9bMwJcg6Oh9TxCd2Amv9MKSR+wXDrF3LF2AGB2FhWLrv0oIDl6iEM8OZnrxH1
X-Gm-Gg: AR+sD11oaFXWB5GNOz+DW0QXebDjTqrOWVRcZ81Cb4Q8L33s2X87FLbxe9RcMGidVNq
	F6hjQmxGY7CFX1eZCjrkFOFFsNhWtoF4dsD5h5VdV0cHCVyApOH/ZJEPfkxsgAug9CvnarRdg+8
	9LLCDxitLm2p/KbOLLZAN4C9v9lb8CQHCnEYrr+FC3u2+47onw7iISShOqTePxFI0eFD3v3bxMh
	CxXJLbJIn4WYkvpRwUKs6HQkOc346+R65Ke9O0UWMy0HK2EKlMHdTCCoVZv9jzl2JndB6HJ4Lg+
	mkXdwyIPc5FqjTDzEQtBq4cAFC6a36jALy16Lq6/kYG+R18JgzVOTfenpkdfIhQcQEbnOo7el9y
	m5hzCx53hrpVaWNY5b7GtKmiKEBqcP6qK1gr39/h94vx2Xq6UuoSz48+Hqoh8z+EXJpNZDTK2r1
	UJ55EaiByVZtETiw==
X-Received: by 2002:a05:622a:44b:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52d5861228bmr28425291cf.27.1786456159824;
        Tue, 11 Aug 2026 06:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:44b:b0:517:736b:e0c2 with SMTP id d75a77b69052e-52d5861228bmr28424821cf.27.1786456159391;
        Tue, 11 Aug 2026 06:49:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4486c0a14sm311584e87.1.2026.08.11.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:49:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 16:49:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: llcc: Update the SCT table for IPQ5424
Message-ID: <u3fbq7j6qoopdvpqbt34dhw34pgsvbjp2b57bh33aesbnk44nm@kvji5zsyp7oa>
References: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-ipq5424_llcc_updates-v2-1-1e4350585671@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNSBTYWx0ZWRfX0A0KD8DArB/c
 xDmbXAAbMXvCwCyRa+cog4YPkSnJMmBratncs3LzqLApzFu6K7LUhDSyT1qIyxBbPq98Scwj94g
 Sk8N20LzPMLGfqN9NpZYBt5F8QWJVizWBIZqoSezK9YxyIBGQRsWPWP8VTqramCWc1eGWPR20WV
 PFw9Ai/gfNsOYd9D4mBs3tS9PaSTtjIp/XRTB3OaUptJNMKLCz6GpSryL39dHmGv7qZgCqgIKsK
 QTlEDk5E8Ncn+jibaH4/PPjMiUkOe/RUc96kF2paVohxFwvRiA6lS87Ip+dJwgtXAQa5lGupY3Z
 biUXtAbkW6kfYDwJUhOZFvlMLuR6j/Om4QyaE0k3YuyTtEOyrWDxAN5yUlEPPOzwHoBnQKBp1te
 0dcQZhqPcz0uAH3v8AWQeox8MVMTHlfmLP7xujfyytMpt2wy3wYMHdz2ZEDgD7htN17AD3hUPnR
 Ti0q04mlzbrteH2zIgw==
X-Authority-Analysis: v=2.4 cv=e/A2j6p/ c=1 sm=1 tr=0 ts=6a7b2860 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=scoem_1CX-FocSWMDOsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: eIuuus3VF5ijNhhEU8cGTkrcBD3aZ9As
X-Proofpoint-ORIG-GUID: eIuuus3VF5ijNhhEU8cGTkrcBD3aZ9As
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNSBTYWx0ZWRfXxP5WmYJzfsCk
 Rokd8UXobGcjPHhl/74szGmV5cV7Faoetc98B7CZ7/8YsBGPdB+0Ojs5xr1wR/tYkDJ0bhSKBCn
 8YkdxzyhLg9k3q48iUWKfnLWcCNZK2g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110115

On Tue, Aug 11, 2026 at 06:04:53PM +0530, Kathiravan Thirumoorthy wrote:
> Update the IPQ5424 LLCC slice configuration table to give the PPE
> and Wi-Fi datapaths dedicated slices.
> 
> Assign slice IDs 1 and 5 to the PPE RX descriptor and RX fill use cases,
> slice IDs 6 and 7 to the Wi-Fi radios connected over PCIe, and slice ID
> 2 to the CPU subsystem. Adjust the corresponding capacities, priorities,
> and way masks for these consumers.
> 
> Having the dedicated slice configuration for each of these use cases helps
> to improve the networking throughput by more than 1 Gbps.
> 
> Rename the usecase IDs for slice IDs 1 and 2 because LLCC_CPUSS and
> LLCC_VIDSC0 do not describe the actual users of those slices.
> 
> Assisted-by: LLM
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Changes in v2:
> - Updated the commit message decribing why the change is needed.
> - Link to v1: https://patch.msgid.link/20260807-ipq5424_llcc_updates-v1-1-1f56362ff687@oss.qualcomm.com
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
