Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0353B27CF
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484694; cv=none; b=WMpH5Up6DBpA8ASKK/DvefoZBKCykU7ifQcoBlfz03gcqhYtUGabq0HHu8I2IIugz6AMasE+z3vOzWYz8nmwXzLnQvnL7y6yUfd9o3/OarSRlQaWrCbP1H+3Qoty/CmPiVhbh3g1s+3SGgu+wENeCxwAfZ7BxQa3wiFvQwkhUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484694; c=relaxed/simple;
	bh=9qkwSkP9DVMjl8zenyaRqwdDdnZS3TpBC7V0mAMwGY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbPJVmeizGdOwrSam0tr47lRxcXlUMsqnYeWiSTq89NFMJfCPqlf7R+e6qSDZbPBSPX+jE3xsQI3Xy2FnDwbzW8g6dg9xS61LrGIO2tHfH4cXfOu+My/hE83SYh3gB8mMKAW35VoC685Lv9WvLzV7acExhEYCKsK1jkODS+y/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9mUAVTP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D2y7A4MO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9mUAVTP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D2y7A4MO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLbBnc2998279
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=; b=i9mUAVTP+e76A6kf
	qXEH4UBXn5uVQDDhFJ/7otsyGf9JiB9/mZB+MGzbS7vsOITCDuXtDC2+FmPCQpzz
	0UVjlHyk2TBYPd1zFRChCSE/0B8qzDtRGyVX9mdrOTIkiazr+noB7NOo690iSkdk
	SJNAgeh4bBvYWXSHHe+VvV2bQiA16ri+ib93DiIg9GMyMy4osSwrIB+jBAp9WZm0
	eokWnJkeeqjuZZEGMqRXDbLvJ7aaZjl3PMvr25Om0Rt7el+ibZeniWpxLGV7u8yC
	AKzOINdQ9EG15YWdZ1uGtFqUyXGfSHDrKXaLH1ikOqQ6EcL90bUz3D1ZGFbHrD3f
	3C6lfQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049bt8mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:44:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4f6ac06aso6461021cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484691; x=1787089491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=;
        b=D2y7A4MOVUW+xusBCQZBPXoYiwgy7CKRXJF6HEWmSA+bL/6NLl7UjvlT5Z4TWok2Cs
         ODmnAa/u5iDix/KoRpvdu4PLzoaAFZxm8x0nP+DYeSoRpWsDedinZnyBG0WLztqtwr99
         hMBPbP0GKTYI48oSNJ5PnLZByyyGI0eXxZXDQcrZ7hsWiMYWfxFCFzgksfypxveo1cth
         GDKUZzqkxuNQgQM+ESS7spWR6mFRpBc2sztmWGwiBXfhEZ+O/hPxw0OvPIjszySS8Tii
         1I6MPNzAke8dqCuf8ffuHcKJGDwERojx6wR8anrraYAZ7JgcOu6ZOqXEjPcBUBu8sN5l
         aE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484691; x=1787089491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t6+GrQMvySoiphPMuXgK1IL1JFbMgM6gWtFoBwqbhmA=;
        b=diwON+U7PhibjaealN7JPq+LytMn49ZWu5/X4RL/qWk/k9m4MO/f1z7UpArZ+slAwM
         jsnNTbWTXu2JynHGYFB1Qe7wl4nonrQyOuKrmtY/FvHN/HWS8TI4oniHVli+yor74yky
         iGMw/0R+xs/pJyWGcaEIl/gPTZDAO4FmbpyLzYCiRJOSpeGfapbFGGoj9eTNaSmhniOS
         lDu4diiIVC6DkiqWIW1ySNxd2pmEu0A8qyBcbwzJ35fMkb8KlTjQhP4bWqjLbKoL/U20
         W2+dh1ncSAsOZG73BRiH79WEvRZd/Il0u2Flann965e0GT2GKZt0WUY2Mh1CFaWH8cIe
         no9A==
X-Forwarded-Encrypted: i=1; AHgh+Rq1ewtdhPw4rMhF2mqI/maP+bpE4J4Py5Y4aJt9tErm2Iji/Xd8xyVt0NrcEPE+UjXLVB2cfKeH5SwmV3e7@vger.kernel.org
X-Gm-Message-State: AOJu0YzCsz8WHXB5UZZ6CFruKBQzctuoLUbTtbZUm/HaYWApT0M2qm15
	HE9d9+EF+bu31wBRuyq4fwG2V6LlTe+dxvhCzmHlLYhb9xEZDPTBLjgDf3j0c4FiytRJXpbIf1T
	enCiUjevCFTYRc8aDuRw3FCzxytyyjsB1scjkL4Ont7FIoFAyczdPd+t9TlqvA5E3XXnZ
X-Gm-Gg: AR+sD10/X+/r8iaTrbOZmy/HQmaWDtEbDXf8PzJXtPOID2lW5W7Ce4LfEMLmbnfc6sa
	UHyZn7sUb0iR65S0F6OdMYUQyK66PXMX0V34KX4g1R8U4ixpqtrPlehKJJBlJsI1tjTBHVXlQs3
	UE4NfwxlnQYybcozprcc/mf9m+s/EbjD/+ukBR2KZ6JQe3VIegoqyqnwmgxsH5h9+EWyMAJ/c2c
	tqzZlYmec9+PqS7Eke4usKW9lxnUjG0vPoZlhLwnRqAr0Nbx1n2G7+Pci3a6YuZMtSm8X5nRp/O
	UFYi4a7LwarO+S+NOfM7W4EXsQQH9gDke1LDiruhDoamX9zdppYkTdM2xcy7Aqp3/SYtEoImOSF
	mDc7e9aX+Cr0J/r1yRVk7fw9VAzIntcqnOiXmlOgPspBdTn7nmeCFAP3cBwfrBzb8EXfbWF3w7w
	F23t8ICGxpoNNTbA==
X-Received: by 2002:a05:622a:a19:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-52d644f593cmr4953861cf.0.1786484691523;
        Tue, 11 Aug 2026 14:44:51 -0700 (PDT)
X-Received: by 2002:a05:622a:a19:b0:517:5bc1:e1f5 with SMTP id d75a77b69052e-52d644f593cmr4953421cf.0.1786484691093;
        Tue, 11 Aug 2026 14:44:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1084e5b74sm768071fa.41.2026.08.11.14.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:44:48 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:44:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Luo <jie.luo@oss.qualcomm.com>
Cc: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Message-ID: <oijzkh6xykig4vufjsxup6xg3mohgqcyhc3fxaimxbhqbg3niy@2c7tgkdk7tm3>
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
 <076b0942-7e1a-4a6c-9293-04a7ff77abcb@oss.qualcomm.com>
 <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a8a773d-5fa8-4e93-8130-2b49997691fc@oss.qualcomm.com>
X-Proofpoint-GUID: DyWXzzktLI-8J0Ch0y5Czpo5dOkA0HCG
X-Authority-Analysis: v=2.4 cv=ENg2FVZC c=1 sm=1 tr=0 ts=6a7b97d4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=4nw3Ypk4z19PjJKWGPUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: DyWXzzktLI-8J0Ch0y5Czpo5dOkA0HCG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX8nLzMd++NPmi
 yYlOyplHXBi3wuN6D0RGetC2SrrOgMtMkCPRo1VE4LEgy3qRZ+hwfyHn7cdQVD47MBVuPJz6GI4
 F1E+AhsaPKh324rQi/rDb60TBTBhsE2CMVyLzGeosb1DO4o3jH+EufRMByYaVsjvICjOCdTCFl8
 jr7fDTyLfZAFV3DH3QqtqoWsNeUGNnf5Y0HcB8G5zave0NNgvUZBihSdhJ57iVEMNHScTsVTAku
 ZvLCBylZp3sb+oNzxNfBw4tRqrtlAl/Z2mVDlQ62FjOHK18a/3w/YIHzut8b/SLONjaXtzoGbjH
 s5dKTJmoJ5hQ1YwH/It+XyNOMbu2nEx+8H+wU7VOsiuqjI0VOmE4q7wMo2QPXxNOsUD7j+deMdZ
 nos56uqz5PekSWlHyOx3uzcZes4a9JjtFQJQJuEjcKvcpg1W/PtS1FC/T5LksoDu2bzjSynMTRi
 osEkXxEkth/7cJ/qmmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXxs8HZInE4Wd4
 bsyQN5RsUGNHJAjEqoDxcDTZ0k9wfadc/VwP/IE9r/itF5L/UGud9u60zv+FNccTlyHzsEPtnCK
 DmsE3xHZBQKXwamlfkbi/Ofi562nkB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110182

On Tue, Aug 11, 2026 at 11:24:13PM +0800, Jie Luo wrote:
> 
> 
> On 8/11/2026 10:00 PM, Kathiravan Thirumoorthy wrote:
> > 
> > On 8/11/2026 7:06 PM, Luo Jie wrote:
> >> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> >> TLMM pinctrl; without this the pins are left in their default state and
> >> the bus does not function on boards that enable it.
> > 
> > Should we move the TLMM definitions to the board DTS file rather than
> > keeping it in the SoC DTSI?
> 
> The MDC/MDIO pin-group definition is SoC-specific. On IPQ5018, only
> these two TLMM pins support the MDIO interface—one for MDC and one for
> MDIO—with no alternative pin assignments available. Therefore, the
> definition can remain in the IPQ5018 pinctrl/SoC DTSI for reuse.

Is it expected that the drive strength is also common to all boards?

-- 
With best wishes
Dmitry
