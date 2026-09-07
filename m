Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A4B391842
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792351; cv=pass; b=pNSVI78qo0G8fNojOH8R8d4hRc/2FBY0jldgMjWZxTkbLngPpqzjd+Lqyoo3IF8lT7CNz9IwpK/R5dO2y61oH5MSwPZJnkV7WL1NP+cpS92S2ab9Rv4WzoQW5LD6MNwmbsHUd9uTaXKmuN8dZIgoBBSNr1i7SbJbwOOZd5czcwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792351; c=relaxed/simple;
	bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iNPuJ7WQ+bsNonQsepAjkzad/CnFw68JDHPHD0qCVO/egA//GAxiTRWCExvv63uPPsn9dGqPlDQo/SiGQz+agAP6BQ6w33l4d356Eu71K7IHTymB1+PAnzjcpkWaOLsNKOCrNQDCplR48hnP9XytvekzuAvPLveV06AYCsbxOv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsCmWEf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GSh0rt5V; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsCmWEf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GSh0rt5V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DeHBF3607022
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 14:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=4KaEx79l/Qo9EXLcB4JmwpQu
	z9/m4i42cFxTh0FVROg=; b=HsCmWEf4i7abXHZFCxX36UJ/9JBW+WwyXSLb/io4
	h6c3l0meFY4K2wrqAPYwPDPhN0liIYKcNmOIacP64rf0ANUhS8t/RGECdChJkO/f
	E1lR9F5KZ3anF9NnpI1PbFk00h25NRbBu3KZTXIKZviecOxgLcFrNryH7X/QY3X4
	QN15qgqVLNttQIjclPIyjVyA2hXMv882k4GG9Tb2kr4VaTdk0K3zQvE4yj2cLKCX
	hkqFT6NfIbbDP/8Dq1V7DI5lVb/kOVLU69oTr5RRxzqpOUd7CXfpPR9HeYGcUhcD
	J03VdSEIX3y+UdzFXHcSlzwGdq575M4hfwBJ4LPdu05Q8g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfxku5ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 14:45:48 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-86e8abd719aso60637427b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788792348; cv=none;
        d=google.com; s=arc-20260327;
        b=FbMza/qCaOq7DmFhXJ4Dz8SNox7qw3NA3J7/TuVjhnfdCU1bXmvVnb1Ou0nFWzmOBh
         r/dtzwu7e6t0WRM4tfCn08gvQAbzIjZy6klyZcBCC1ZFKCMXfr+tQdmieaJoL8I6Tum1
         A7sJsSWkiSlDqtVcpX5e/lRN0DDWKwHkTVZUtBWNzB96mG2JoBice4+hSf4ZoE+rkjzO
         VhPf/uq8UtxH5fAe+cR35AVUBlpvXUFDube3+1+LLFPp4YWpzBtien3PEmcdu51Nyi53
         uP7iPa2I82IG/n62datEONExm3xjKGh8GJbeF+rvDmwsrcWauqevDCSf5ckKaZxw1CDX
         /mKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        fh=wCGkr9gQykWDgmna4IB03NWSrfkBHKKQjcWuWjZoMec=;
        b=JLiGeWFzWQXwIxE+/gtgmvC3Rl8VqGXGI5NCY1bQT0h/h79ZPHfO/aoSfcEvbfolto
         YYsBbw44qg+nK8prytZSDs8GYMzg5gawx1Wwy699uan9Vuphe1zmvRkqN3XlhNeYQCK6
         4bRlWWKj026UAC4/hHkZzGFPGWbG+ujdtQu80Hpx6qqKLF55locWnq/QAGPYic6CjHDM
         52sfgFJr3UgWl9Pclwk3vzTt3Y0vTbC3itcsoxCcW2idksntcbEmb+QA0CI5hhyeeGMH
         fuSC58x9eDGoJFB3xIjk8wrkbmy1LvsGp3PMpfmgpJqIzc35zmXkTWUj7ybwLRqu4UU0
         k/iQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788792348; x=1789397148; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=GSh0rt5VSadtGpqLmWn9waEjl3l+Moq2hiUmtJ2fMRaEDk4HTb5vG7gn9L0MBfR1Jy
         P2NdTlSDbuHnkxz7aKPhdWrMEC5JQm2QlKgvAb0+Uhl8iLLL5Av2saTe/Z8Z0+0+ggKt
         GJEMIMHKOUUisvIHhvtN0F3F6vTMoYO27MpLFF8oBPDIorHqAaqVZXsdwYAU3QYL91q2
         fqro1rTpujo9JXvSedM5Hzs17/x/f3vuRCpBsbAnSA3u3u/1h5b3ICICNFEws5aH3TkU
         MxVIfPjgXEVeypkmKJ5IY+1k+WdSxY8DIp00nKC3RJVdYJaaHWw6Uf4KdwqiU/M79G6B
         LGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792348; x=1789397148;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4KaEx79l/Qo9EXLcB4JmwpQuz9/m4i42cFxTh0FVROg=;
        b=rh0555gsMPXKP1R/2TL/iPvC5+L/7vQvbFSR09ZRpAsDIG5gzQZIR4EbiMBViapaFR
         v+BKdbEQqfu3YPJyPufr3dZ08sdUereVfIjpA5kdxVDVuB+blJkqPy3voPT2tg3/z9sA
         xMd9lQwnC6nrTyOSPyJDfdYeFDDd63+LQGGd9GTSaWBKCUq0Uwdxj+DVcmjmk3VCF68q
         18Ay11CGULdF64pE39Qfbhf/GMSHFkJWcCRrDqTNJOAmahZrpKvPPGf5TGCPmAoznaxf
         v0IB2hnqFhQBjWxlkIgiGkyEODpEbTGRyj1YqCUXsTR00aynHGC5/3BP2PiIBCIfgA4t
         X3+w==
X-Forwarded-Encrypted: i=1; AKwUvBx2D2Zyea3s3h/YV95kzfA2tYPQ1Z5HKbqzDah/e86ckDs6h+YStn6NLjXJzbFFHuwGRugLaY8d2mbSpbyu@vger.kernel.org
X-Gm-Message-State: AFuF++nHLFlZPjlIe8G0PSbFJ7K6+Jwn45WG7Hv0z1NIpXFuLnGbeQw/
	WrIC1Mf8dwgiLbxhQgzINCn3XZCWAeV2gAy7EXlzDYX8yy2EKJ8nbnr/FLLrNMXRrv94JgeLBF4
	cJ1tVBeKaJSSKi3z5mCRCbqAdoe9Il5W/dS5DbxCzf4d8lvT736aZoVz38UZyHEtIGllkMS0ljZ
	5gxpSg4fv6jFrczcRcy0W51vqJL640SB5AYgRtVsRbLxw=
X-Gm-Gg: AYBFou2DpNsWwb3orbidI84kbeckHRvVNyjU1crGhnQMJaWNitWYNMstDC1yXnFd3s/
	lc7kcer1BNa/n1pzjwUCyYrq6J/sAmZ3nItVU02rdniCdqYv5pqsA1xcdIdB9QUHuqCZpFFrsT7
	9dhiXfFVw9R7X5PByeaS3Z+KIvCviL3tXCXrkEuVtF8T/uWjVDvdeP6sZ2fA==
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id 956f58d0204a3-66fbc1754c3mr3690255d50.30.1788792348500;
        Mon, 07 Sep 2026 07:45:48 -0700 (PDT)
X-Received: by 2002:a05:690e:450c:20b0:66f:bc17:4f18 with SMTP id
 956f58d0204a3-66fbc1754c3mr3690226d50.30.1788792348076; Mon, 07 Sep 2026
 07:45:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-2-harendra.gautam@oss.qualcomm.com>
 <20260907-arcane-sassy-fennec-afc02a@quoll> <CAC-tS8BVw6hbgA82V1mYL_3CG4Jdodr-DQbGfM4FzMMdCLbc0g@mail.gmail.com>
 <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
In-Reply-To: <934b1e87-3ebe-4a6c-a925-6b3993cdcec7@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 20:15:36 +0530
X-Gm-Features: AcwNN1X7F4Saf6Z-HB7nxKe8O53d3EFKPM70E0Ja_RmgPGm_qltV-8Gse5aESAI
Message-ID: <CAC-tS8BY_th+qa2DogXSZofkX8KaPJfL6iphX5_TX37NXMA5AA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfX375cfUQWgbuq
 5r4GAzvC4mQ/RvSlkasgs6/k0HlS8rMIPYKZK9siiRfYb/mj5ibeiAuDssnEp3K8BOuDxW/H6b2
 6rf403/s1LHZXs2iXP2ytXV6G8hIAOJAzZSUBf/AaVCBoMnROnpKMGHtwTtynfV9m6FjbxH2WXp
 wkhcS+0V7QgHLdVNI/xN0OpriwirwuRiv4fCWtje9KR3dcYW/TuiD792sva2lmVrzp8zSn75BSR
 pSfA/HNAEFMpz74Wd/MkJ4mvYFkHjyu/WT3DQXW3nSEnANv9Mi+kuhDV+e7tuY4gbFn1prV/eZX
 S9mwOzSuNf4k6LCA6Tu0t7k7tc2KdSsmSBDaSeq4ASkxLTK6fh/xBOw/ZQDIWz+g9uIsKatLl4o
 DUlWi5e9eEZGiDnwgeEjsgDYbnfBoGB+/Yp4bcbEViq1mPs0aOBrcM2MVJczUUwuuP3fENLYqes
 dOHq8IFLyr5aUsjR/mA==
X-Proofpoint-GUID: rsuQPnay68bMu4u2WCto5HOWwMolWRPD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE2MyBTYWx0ZWRfXyPOuC3e9oFv9
 MXHVL7FQvIGZZdxNZqVwdQiBqeW56UaTMKuWbPBJvbVc9Xubjh+fQn3QD1zGTeRUiiu0joEvc3e
 1fRE3rlO1MAL5F8hb/Zuhpgxjnc6Oxs=
X-Authority-Analysis: v=2.4 cv=daOwG3Xe c=1 sm=1 tr=0 ts=6a9ece1c cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=emP4cCs2JGfxw6IAegoA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: rsuQPnay68bMu4u2WCto5HOWwMolWRPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070163

> > the binding intentionally allows subsets for future SoCs or board
> > configurations where not all interfaces are wired up.
>
> If the board does not need to enable them, then driver should simply not
> do that. The clocks are still there, so the clocks are required.
>
Understood. I have already raised version 5 using b4, Kindly review
version 5. I will address this comment in the next version along with
other comments.
-Harendra
