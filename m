Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7405519B9
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979711; cv=none; b=oG8iL3svwCbBbes/vY8ikJ26ZQZUWmLIRi6Q+72CgsRFHQaUrkRolfXYzABfjdiVBYpHzNabw6rXTCPQS8CuDkDWyKYRZDwSIis08uNtbsVD4ivjN69e9k9BGfecRNEIcEg53NbhbKFYwcvePf2BmEfjbpsy7ktNrbyxQE/uXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979711; c=relaxed/simple;
	bh=j7AomWY1thDMvf7jR4qY04R02EHtj/ZGDJ+4eUXR6c0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNDjBMbOluJZkKMjujeafiZ+ZAM5zh8lFjNnT6kk7w9PG1tYeotYd5V2LjY+RQ0DDZvfrUNKjcIboSBmTDrKUmG5PojtUh2SN7KcX/JGpTI0OGSYum9UTbv5Nh/ENKfZjg+SSGjuCZG85SpESXMH8U7hlAQ6T6jXATbI2ZqJgJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5TadpFj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X1EGiX1J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5TadpFj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X1EGiX1J"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IgEOR3343952
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 18:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B2hhKwHh4L/fYX52LOdqYTcz
	ulimqc3bkV7EnEkdcCc=; b=G5TadpFjgRMBag1VZK9dlVXajPoJaiYkYimCE2Rs
	tC4eLNklRdIMutzTIwqtSLx1y3sbB3MNBwb5gqGBlu7Gt0NxC6m2ttg4cx33FkwG
	mR/qUJXoGeNnZtyhdIY3CwmpvUe47iOUF9xi/WxWtlVD5Esx6Q5Nnee5CqxBnLzL
	AV5MUQVLnF5LXr7EvO4G304Nge2LaJME18Ccd3mdu3OgzVCywUnfBPgt+FCFrulq
	wCBRTK1VZBCSWRRyU0hP+lIL6q18REZ6C+wjInrzKQF1NEf0VGqhHDdfPDVDc631
	s1RnHt8NmPdC4uupkMsUisxj9Kbt/T3eO8iCNK8TdmMDQA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygg0qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 18:48:27 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so7598118a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 11:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979706; x=1789584506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B2hhKwHh4L/fYX52LOdqYTczulimqc3bkV7EnEkdcCc=;
        b=X1EGiX1J3geaZ9YDV70L7D7Ea+wn/koG5YCqcB4I0MmIMKYavvPu5oliiHBRYUbNu5
         1l+uUAeJp2RU2LkLHJWwlWlzqUKHDLpH70V3tVzQ379agqfJ9KlcmEqXu7cD2b17uY3n
         KvE0rh7/B0eF2RThxpx+DKv8LAGZ/xT4Fu723YM/KIRrQ5qcGbHFJMfxMLwJeeMLdC3s
         sECU22ykI2jOC7qH6RL8fBcxbO/qsGZxDJI/pxROMZjJk+B/TRo6lgNSLPpDDKUVXdoR
         ri0f/GfokP57blxc0rJOaowhz60DZw8eaGCmqb1UJ+D9CuHHQyEifJ+7sAUmA+Pgjrxl
         Y/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979706; x=1789584506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2hhKwHh4L/fYX52LOdqYTczulimqc3bkV7EnEkdcCc=;
        b=LQ3jvYDoC+VScOA98AiG9i4vGrJYn95qJKpItEX+dXrs+loSUTzqzVmD5NsMnzmCAV
         6EVyeAz4UNW5ByksO4NQ3JzcPoM5RtyY0eayPLS8A0hVqee+c5H2Y9x2fb4hju5djBlG
         sxskUBDXm2naqEE57d7wJmZUOQ9TGseOViaaTymsN4ymv/3dQCRUapQKzNDpM4onYQeM
         /e/PPT74OTlpMPbTsHOV5+Wadsacpd/y0W+5oBSGHKZ8x16lAV+07JtMl8QQ2gV956n6
         GW1/pY1a6QVJa91YhsXqHtomsytcrGeiDImDtLBj/LgbKfxHy8ahtCfYD9CJVlW9PL7Q
         VCRg==
X-Forwarded-Encrypted: i=1; AKwUvBz7ifN0RC/rCmTD7OzJ8Ngdntawo6ig6+q6rvBa8xjBKsBjG4fu2IaIhjUyQkBVgWL/gvrMe1hactZY1wKH@vger.kernel.org
X-Gm-Message-State: AFuF++ny6tmEn/HrMEub8VJJbBCN9LXuFNWoJ/2ZXmEMeJNb97f+CCYw
	/TFcvFUbyQDL52knumsHSHc9vI1kOuXcfl4XmjM5wTvTRlvdPBVgs2hYjOBu9mTFkOhD3OdNLZd
	Ohg1Bn2WqKkvwbmdpMltb3HfLnGHqO6JtYB5arEumvr+l0K4QBssySQLeJ3rRIUSKbHgs
X-Gm-Gg: AYBFou3uMkW0dc8yl2E3EQLD5i5wzXCkt8/UATlkSZ9AlRsKMgdfiUg48G0D6mrGM6b
	5gKoK2Qp2JJ9669tNa8HBrODshl+E7QFg0hPNPrx3Gm6cxP6CxGwunTv+teAeT+MIHVfJt24rEX
	RccbXfOaBNgiP3PkUuyseT+8upzzGohSGsi3U/9+yz+LS9N0z1wuxeCmMsH6REOIxn4/u7dEuSw
	uaho2bwVLhOR8ja3oYl5Utaj5FHMCHItAPqZFUW4jFTCvVZx/yfbxRIOIgh4VLFVZO4Tqg8DrmZ
	PYiWNjrFGHTrgkScZxmOjFyAemGAkqHXHOrZMQ5U9tII+jso78hN0hna32eHXtj0/V9nkpTkZZ6
	rnaqpiMzkcT9srDl/KmF6Nz0YzpfeRcLj0t6QXVaD5BscBTxTFdorJ4XsvmwZMC0YxLMOUnecD/
	fG4IWQpagdBXHS
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr16558655137.6.1788979299748;
        Wed, 09 Sep 2026 11:41:39 -0700 (PDT)
X-Received: by 2002:a05:6102:644c:b0:786:d33d:af15 with SMTP id ada2fe7eead31-78a4a94a067mr16558625137.6.1788979299306;
        Wed, 09 Sep 2026 11:41:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a37059b0c3sm48907741fa.30.2026.09.09.11.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:41:38 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:41:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] interconnect: qcom: msm8996: Configure auxiliary
 Venus QoS port
Message-ID: <tmngp4764jqdprnvtg5nwtvhvtpptlswje35zthugs6mx6qpsk@cmgudihs3zjt>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-5-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX1MnAAUB4wAXP
 sEC+Fz4rhOIqesqIGZ76sJaIT1JYJleIeysojKvPbLlQtUH5YQM2EZsKSXG/qIH7P8JDPlJ58OX
 9lWRZoPDF8/v3HC8NfL7aXMxsSIUJb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIxMCBTYWx0ZWRfX6NraQJWiKhtd
 tOVEB9X0j6II57JhbAHAnpOLL2R/mBZ8ThcAMK3590Hhf/r2UIfBV0uH5PGTUcwfCD4SIwpU9fo
 1pKuQGz2YcYus67s74vdURcU6r04htAo7V/p14Cx/thVIcx87wyqrH9T4sUyV34120tmqsMlx1N
 NYUtlb1IWC5hnsbpkpCnOrJtNUDE44VaV2p8Uus4IOb8AeXrFuy3stQp1f3RX5+81GTiGuVeQcy
 r2bmHphnYLkoNbDdEjgouq+NEJ8H4WoB6ASLggnD6XX0Z+mn4doz2T7Syj01z8P/nT1KZHJZjMX
 EXslB8Bsru5Tyf/n0lytVlEF0npgezZd7MsiMOjmWY3TXLJmNPnGFUtMkd99khqlezGUJrSUY4J
 gFtcfVRLEB+vw/mjw7378koJD5ieFZD92J7nTFtkMpFub1vl3JCypg0z+5KfCR2q46z+3sLM3XG
 IDxj+dFOafb9EQBcMsw==
X-Proofpoint-ORIG-GUID: Aa6I8_TpJ8gOtLEykNTrFWZ-_nIdWf-Z
X-Proofpoint-GUID: Aa6I8_TpJ8gOtLEykNTrFWZ-_nIdWf-Z
X-Authority-Analysis: v=2.4 cv=Z/F5j3RA c=1 sm=1 tr=0 ts=6aa1a9fb cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=YMW5T1WhuyZJOF4bxVQA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609090210

On Wed, Sep 09, 2026 at 06:41:58PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Enable the secondary QoS port used by the MSM8996 Venus node.
> 
> Assisted-by: LLM
> Fixes: 7add937f5222 ("interconnect: qcom: Add MSM8996 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/msm8996.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
