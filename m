Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6536B36F42B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701487; cv=none; b=aCGiwHm9KBO8o3BtMRea5YHJPg6KN8AxjKurcrE492y3YQpWr12sV9OtdctrEC/K7Hg3aOz3CKIG2o8kagy55YI73gFXjBRYj5Fb1HN9F6LLs57CccNNVT7imEM23BSniJD1QV9/a1h2ycbRAwE1xSHJxbjARL0eNKkmXWj/4as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701487; c=relaxed/simple;
	bh=4JrvcEngBvteukCLZF3brC/gQ6K4u5RpsDAUv1E9TNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eCQ8l5xs5aDzxsaJ8aNN1aIUYM+ZhX0PdCihuYAjpXyGzXFQWJTkH67S/DFdfTkxCZYTcIUzGtjQf432MPTOwrpJrmQkkQNsZKCs9GHrGNY1fRDFIpaPZLHIBa2jR/BaFVFZEmyujmzICHJAaMpO9K/XbCvL4RDbvryVVm/s3Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AqvKH5uq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuA87aBR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AqvKH5uq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuA87aBR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53vUC3996189
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UjYqDC1SKZ3nBm6fQIO0dnEk
	EFHe/0NSqXY2M9ZBb5w=; b=AqvKH5uqhvazImNG5brZGoDvP4skotjHkY1U+hdf
	AR/9k3jWtiRI8AjwO175fSOjx9wYY8Ph4farlo9GU4BS9bKQhioWu704tgCquO9t
	mcy6ELqAeqfhreeS6gEXv3KReYvEwWfsx8g6OJ9/hmVSHzk+TaUU9/uQSqh4yK6S
	G7KFzuQcNwRnJAyQGBHUSIBpgcDXtj9M35YHe0oSj74e5EZWh8v+FzqpVoYcm80s
	8ca6StMbPXiWoRf1vkjD/01bYooajNvW9iGJ55zRMChU2OaZAg+AMsg81K3ACXvV
	rDm5NH53OY748gSa2Q33ydnXaSuUZZ5Zq/DUuA/TdcQa6Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d2hk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:24:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso127867001cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701482; x=1785306282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UjYqDC1SKZ3nBm6fQIO0dnEkEFHe/0NSqXY2M9ZBb5w=;
        b=fuA87aBR/boMm3Ax8Iu+suOZlbzzdnMS7TCGfgAmc5VKt3FEEKzsgid1MAVLVaSgGB
         NitRggbJ9zhpsEwyzcaeSDdGQrx3fWuVj4U/9cK49LO9/kV+YdK9F6m1B5Gm2P0FJbg+
         VU7psC+hVvqsNkqhIz89g5w8I3Vg67AFN6v4WvddNzVp6g8yYBbKPYm9u0bJBeP8LE4s
         27hRIq7G1NBP8RIHzC9+ETGPib5+volrbNwknrvVqOqZMtBjmhPJFCs29NlEzplAt0Gc
         orPQFzr6dWJ0orWi+3cIeQkLFC6lD+iTBCVSm0aTLekyS+LZRaf4ldI6VTv0OmWV7FY2
         fusw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701482; x=1785306282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjYqDC1SKZ3nBm6fQIO0dnEkEFHe/0NSqXY2M9ZBb5w=;
        b=fBSjp1kkorEO5HvUu8ziC0mD2bn+oXtRLTEWJCBwSWABi4j0roIjvLT6IUts/5BgyY
         wjWEx3MsCBYX4pqvpBab4KC3Srk6+0eIJYMc4wNr7NGqgdyxK2ttL9zPM546Il/wV4Ua
         Q4jsCL5Ao0fbDCtmcywtG2MQoPbRFh0I8S1F00SEQHCe9tux4jpA6r5TkHD5hPCBSXY5
         mzRGO6qVkoqYnyC7Oo5TRAwGqE6WcBCUoglRKUwCVQUpJN+v1JYz2Cz/MCCjK2BadwTu
         tPSlxz5X2slDmcs0C1N0lqEIv8i/KQIzc/WbmUckMxSE7/4QCYjzhr8usYaL9Khw3O7W
         biWQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAGsZpPMZSeLYZqvkXGmS2wMCBRqf+gW7NYMujluX1tYWleiYAYqSgyzDEkMv/FddPPfpWNOk1A0aiGskO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tPkKvQTa7QRj/2JvPyC0YZcqV7iu7WseL/Dt3D8PLaF6nrMr
	Pp7PkrHuOLlPpQapq6gjZJXDUDfnOUTZQ5vnaX/VuNZStIFQpxgyAhs9ygZAM2Oj39tHRtTOnh4
	lUd+2ZgHCEcsv21A/6RASEOiqbSF374zOP3bYQv1m+4MUzxh1Z0j8dXQ1UvjphraYkj0+pOmF6Z
	jD
X-Gm-Gg: AR+sD112bdoddmmBNzWwn+gmo1+z5wVsm3FLnpY9A5CELMGYCmnT9MEWjyAWezYLgFg
	A8zbkMAXpHr25M4D4+rYOIttOl8I0S6jFPV00rYZOfE1XeDL4LsAz9EXafx9puV9vgQbyPkeG6t
	ZG5uI9nSKumR5vUHZ8o1/G9+9YLjflPNeUt6r58YoSaOzSX75TGRDB5YWr/6iqd9Gdmnw3Ken4M
	9UdiUG7ARcJavxCSd1EH5RygJW+OFiT9r/PU9MN8TFvXyvAuiU0m0yqfXYkMqXCPF/TSU4n2r92
	ZmmVe1U45d7Obxb8I0/80HX4+bjYZJ9iUfzZdASIxICUztQL2r/xpihfDfgvOiLdfCIj+JytKGI
	4STifxIrY9gvL5y6FGp+A+xJZP69s8YjoIeH7+VEtm8GLegwaBV0/gePiCmqF1ufUY+7GOGxCrQ
	rou+XuCvgtBpSebA==
X-Received: by 2002:a05:622a:8c4:b0:51c:b98c:f772 with SMTP id d75a77b69052e-527a69fe0f1mr28843991cf.15.1784701482412;
        Tue, 21 Jul 2026 23:24:42 -0700 (PDT)
X-Received: by 2002:a05:622a:8c4:b0:51c:b98c:f772 with SMTP id d75a77b69052e-527a69fe0f1mr28843821cf.15.1784701482014;
        Tue, 21 Jul 2026 23:24:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d318c0sm301804e87.38.2026.07.21.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:24:39 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:24:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: shikra: Add support for
 AudioCoreCC and AudioCoreCSR nodes
Message-ID: <gotzbjedro6lkzpk7xfszzymg4rd36jb3qojwlm5yelvi355za@jufl7tenh26b>
References: <20260708-shikra-audiocorecc-v2-0-b320d822cdd0@oss.qualcomm.com>
 <20260708-shikra-audiocorecc-v2-4-b320d822cdd0@oss.qualcomm.com>
 <71576059-b5cd-401e-b4b0-c1784f24ba46@oss.qualcomm.com>
 <81ac9bcb-65c8-4cd5-bc54-c350f24d06a8@oss.qualcomm.com>
 <cb9b3fd5-e63f-4367-8fba-cd3cd11fedf8@oss.qualcomm.com>
 <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b9540345-63c5-4da2-b761-cf1aafa8286f@oss.qualcomm.com>
X-Proofpoint-GUID: wGaEDGSyhf_WfEk2W5U2SbEveBlbYUVK
X-Proofpoint-ORIG-GUID: wGaEDGSyhf_WfEk2W5U2SbEveBlbYUVK
X-Authority-Analysis: v=2.4 cv=XaG5Co55 c=1 sm=1 tr=0 ts=6a60622b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ASnxAr1qJVsTKQ4uUNAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX9Lp4cCYFb/Ky
 VZQSbfbcudC0zBXpzi1PVjQUpUHD3fRXHsZ3z/dSVuoENqVY3KrMEgGWpNbZnQimpxeSTJjUn08
 cScVsOkQ/hzyzswTXt0neJF79FfOy7I68VNSvKtvHiCUZi+1QgQj6rljKe0tUtlfJXa2SORJmIH
 4E1OHCYuUnUkLutU0N/dr39Z7lkBwinNB8kpQJXIBvMhWjSwf0jzMNNHRa6TGy3yXTQNP5dk/z0
 HdnSzgXIIkPANI2BoBcMGMUDjsnk5xKzExyKcDLKEZL/lSigM7MSAbqBMgjXLb1HE4Ksfjp/QM6
 1NHN1WIv0xlqAH99pN2ZoJc/a1w5Li3C5FBrNHsNZoNZTnHCi8Xa0e+s3CssaxPyDwpZA8FLJtk
 3x7bgNKbQHoOTW97PJv4koFsUvSOD+WzRi/VvJdMe37DtobSYndvGe5/1jQ/bS5KqASKV0OeLo6
 HmJPJcTOlOq7J6snHJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX0tOHZL6JYGvR
 pSt/LSpdBcwdX3EOIcQF2fmM/KJobsqlsRx38vA3qxeqtbfMJpVwYoyCKSMyART5wnTaCgMk2Eh
 9nCX3Nk0Yn56rKsrRsHKcrh95MScPeQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Mon, Jul 13, 2026 at 06:01:34PM +0530, Imran Shaik wrote:
> 
> 
> On 13-07-2026 05:44 pm, Konrad Dybcio wrote:
> > On 7/13/26 2:07 PM, Imran Shaik wrote:
> > > 
> > > 
> > > On 09-07-2026 05:30 pm, Konrad Dybcio wrote:
> > > > On 7/8/26 8:25 PM, Imran Shaik wrote:
> > > > > Add support for Audio Core Clock Controller (AudioCoreCC) and Audio Core
> > > > > CSR nodes on Qualcomm Shikra SoC. The Audio Core Clocks and Resets support
> > > > > differs across Shikra variants based on Audio subsystem enablement as
> > > > > follows:
> > > > > - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> > > > > are required to be supported on HLOS.
> > > > > - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> > > > > handled on Modem, so from HLOS only resets are needed.
> > > > > - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> > > > > 
> > > > > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > > > > ---
> > > > 
> > > > For the sake of simplification, can the resets be enabled
> > > > globally by default?
> > > > 
> > > 
> > > By default (PoR), those resets are under HW control. For audio use cases, software desserts/asserts for switching to SW control. Hence, these cannot be enabled globally by default.
> > 
> > What does enabling the provider node have to do with changing the
> > state of the resources?
> > 
> 
> My bad, I interpreted it in wrong way.
> 
> We have IQS variant, where we don't have the soundwire codes, and hence the
> respective clocks/resets are not required to be supported. Due to this, I
> have kept the status disabled, and enabling only where it is required.

Would it make sense to do it differently - disable them for the IQS?
Is SoundWire not supported on the IQS at all or is it not a part of the
EVK?

> 
> > FWIW there's nothing like reset_sync_state
> > 
> 
> Sure, I can keep the audiocore_csr node enabled by default.
> 
> > Konrad
> 

-- 
With best wishes
Dmitry
