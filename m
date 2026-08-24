Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E613AAF7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560333; cv=pass; b=Wi05g4r9HFtVyyXtBbhIVHxyqZSc/DhdDMSTpWgSy9p3i2g3V9A97lxLG/rId9ZpCsR6nN1Oze1NtFA/yUJVii3EmEunzs9mIcoUHgy1M7ea7rfcY0AH/AbVtnqk+lBkC28wUfkm49gRM5/ehF+8eHhQ+IifawlS8jp2VfdKOv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560333; c=relaxed/simple;
	bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VDp+FPrrbK58knAVIo3nbYNsFnDd09hdXFPayg7P0UOCALCY94Jwc5XJXSezWuhVHNKky+CwiDoR0hk+3++mUSDLFaYNnfb4lMWO7QaV1Vn6aQYjos+pHspdzhhZUAb36SUdJuV18kwEUk0MbJiFqyB0ThqZKs3JJ+UqJ3KrJtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAJwJ2fH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aKfot7Cq; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAJwJ2fH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aKfot7Cq"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RFYJ3067011
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:32:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=; b=iAJwJ2fH561V9pOv
	E6dSfmmr1qGjTpqQqSRLdKecJ5SNx5MSh7DWN4t3qtgSvuP3EK4QDBvmWyY1P0IV
	6Leq34ru48UeDrSKGCi41bLjrtIiqVshbAU8ak5qACs0Qrbi8eNZjFb+sNaBExgs
	WJ2k7qYrEiEcAIG9hwKVE8TJIEKvX8mJ8aG6Pz1ko78xWuRJTUx2POUYobPhsz2D
	ZAhtIy/g4Y+xUg2ORsybLpEH8en9AgKTmg6WcXtyj13FL2M9aqTbQH//xDEExnDg
	CfcYc6KTNkNsEfwwFI8JwcS39uAdRJOoT26kutXWXQ+RtVD0iP/4wex3dVxVFuoH
	B7pN7w==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphpab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 08:32:10 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-822ce245c5aso69264077b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 01:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787560330; cv=none;
        d=google.com; s=arc-20260327;
        b=Yq8FuQbvP0kwxiySTaSslU8hi+oAgcydorqPPWWMQhncryjllki7msE75Rr4+Rya/c
         yH7h1sD9ew9Eco0nNV9vvpF7rnVp7haAN2F28XbOoibDNLmlzXWHdZVUqI/MrwwIe5iI
         uE/PIehzWecMPsVMMfOlc3qji01ptOc88vreMXiNRqRJux4RDco/Uoj/OK5ebA6cSV/r
         ojEPUWeMofkXLhWTN+VvJwbtUkxknum7lnwH8jmmwGJ0s5d0PBFdjtsMoZTJHKLmGomw
         wIkwMWjCQpWk9cMXltSUbwDhobiSvIRzU6qaNJD1f5sB+nXnqnWn6azKGhF9VEJgSrgL
         vH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        fh=7O7rPJ72eu3WANFyjL8CZaEXKHKP04GqaqXHZJwOrlc=;
        b=p4shkg5ptADQfdxN4inK/SCq1Jr3guaLmTXgcNT4N0VbXkI89KhfWOFGtwL8I/c6QB
         gn6mmQajD+qhXuccEUzxMPvWL8Ib3eBr7cgb6+otQXri8f6zJB0aVJ2L8hTkxFrNlFeM
         QxL10Xo2rub25Y6VnloP3hzTygzApWd0to0dEn6i+OprRWYX/WhdC6TsIz+BzKnHAev9
         oRYbtQJh27+v0Iwmwgy+v/bJL0FWAM79DwaAe4udff9zou2DVgErx7qE6Se66NDynSjQ
         yln7vpbVx/S8l24cBB+Yf/1eUwLBprggfv/RdswXhObm91tKQRoUN8TKXMa911/qE4RS
         U5TQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787560330; x=1788165130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=aKfot7CqsuzPO+VqzrhzEUiRJ1NRR1wQK5TFIVn4ClhPIHfJfnYFoEC2rIUeVFPsTd
         rHxow/1PKeEmteGcu9JLxCCj15YSnFNOZ8AU+gyri0O+eDsfTV+ddOf9qA9n1sn4vTj7
         9pJ2k53mvFlHMGeoeZxIDF5QMMSn2crbckeUCfuGxEGnrhgDUFOew31aasxjgzMdfllG
         z2c/19dDUVYoexmSnRqS1Y7SPdewckv38ftXUtGjj2s7L7KtmRvuU6vfiuYiH3bC03Mn
         EJm+4vyMrjR5zFlyoQz7HdWqnCMs1n6FPDt9HSqELYeI53W0ywBIcjUCUbv6BpncyO7J
         tiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560330; x=1788165130;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OsLabnTUQLSa37QP62UStYwLD5821Za8zb/ieqlsFY=;
        b=CGOvott3ct0r5MX5LmNaGDAOVf6VdLehRc9A7oL02lqyBzxvkAav+PA9/DUYDLXHkM
         UZn/T+Wd5ncB99iv9z6vxhcUB59FkMXKHLkO3en9io3v4wXXkjWj5kUhDuciXyarQdTr
         mJaONo9IwUD1LCxo12nA2svl1tD/EEAJVRBhtolo8zOwLZvvBhfSB2baPrhtmV5wGK2g
         qZDwact2nCgA+fpcUl1MZGJzD4fdmc6xdaKankxz6tTR/7wbBV+xtWpM8HZtaVG56HKl
         MHOoGl47l4R/Fnm146e3Y5MUUzM2Cw/4ynrF5EGnlbEcY0EfuBKq4riz1/76QJMmZCE/
         u2OQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7AVixozCVypPPIAjbP2ZHiuUQX7ezNrOjt2i8vkPVYvMgxTdH+2tyRAUCvzqNtiufKwjvTKcT4VXYGGk3@vger.kernel.org
X-Gm-Message-State: AFuF++mhQACXHHAB1gOsOCmvkF7xtZNzIFyuJ1g8zWVumYWT0xEzrnAg
	JbYauDiXIYwOrAlY4YtT2FTlBINjDeDn35+xzAyQeeu4fraPS4wE9S3JUgl6i6L0mwxc6+TB34w
	foFp7o/nRNW0Hg1mXd55nqgsG1cLJ07GYk6BVKENJTZ7lyYZp2zsCskq5fWCoA3R+PeMKH9t3Zy
	kdRLptF2QIrye+dLPwKExqgM+41X6dh807uXhys7KivXFmvNi4eKknHA==
X-Gm-Gg: AR+sD11Oxx6/DsX6ApvT3cCIwvK6CCt/yOoQkU1e5K2xULSOEigqZKUYjzw7vewgRqg
	J4lJw1qY+hX6SqMBrFv4qsrFIr2uuG/BBL0+PGb6FTcGDyyht5rGrcwxjOgwzi0xlzjOVqxn5pD
	MZdskXdQl6mkFXKA4Vo+hCAM2x8x1YclpBvIJLClMcdvSelsEmlN4vWepdwi4=
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id 00721157ae682-84c97c883fcmr68344487b3.14.1787560330033;
        Mon, 24 Aug 2026 01:32:10 -0700 (PDT)
X-Received: by 2002:a05:690c:398:b0:815:bc6a:2e48 with SMTP id
 00721157ae682-84c97c883fcmr68343627b3.14.1787560328615; Mon, 24 Aug 2026
 01:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-10-harendra.gautam@oss.qualcomm.com> <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
In-Reply-To: <slkmp4xwsb4it7fdncmey4rr5zwjj7ar4iktps5dkr4k6ndpou@ayfexlgpitm2>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:01:56 +0530
X-Gm-Features: AcwNN1WlNs-6qzytO98tphr2YXd4fChtRhjYjtP6PBN0OwEa-gIZgJvnzverDeU
Message-ID: <CAC-tS8BRZk2EM_mP0aTMqv1uCdZ3haVbyhDZwTZR8abhA-SJRQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] MAINTAINERS: Add Qualcomm QAIF driver entry
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX1TFmOYVEbZOU
 v9yxpZtTdBvaGjxc2qG1F9GRU2qM8m8J8M1NPfYY1sE3iTJSBfIgBTuAT4urIDMth3YuhWV/UkW
 pY5XHHbR8snL/Ct1cLczlrHprmpAISZLrkOcxdGeVzFdcw3PQZ0vR4OqGQiZ3zAkKY6Nov5z0ts
 psxbagIQCdCFJDc4eGMHxhyBVlGBmWymSWA7mSAT50TYB6W59Ec3EgB/hPZeLMf0fXYnUoQ0abn
 OYWyYyhbucdavJ0DpCUbWH7kPvKePVf1A4S7CBeYhRgjus2qSzTCAbR4jP0xS24iHeiFszwoaNI
 aVLI5/euBlbLRJv833jD7B8jpdFc/1V/fldkfPl/7ySNBk+8chi1gjiBwtst9YqIPneP2Lmd772
 +MmnX/2OoKHqUT9/6q8JBv7fBTazar+0Rioh3uW9us5nU6j7QXkRZbmNht2E41KDRV1JKvjOj76
 kkdNXH9Gv6nZS6h1iGA==
X-Proofpoint-GUID: 5-TRhjYTNaAHng13_Mvu6iyqB3Rq3JWr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NCBTYWx0ZWRfX0T6qYJ0gYYeY
 9R4f7FS1myapxOYgVFbH8JeIC3THo+2JjYqpBAw5J3/ySNO7ftmSAqyvi05VSG8c2yUUiaXRRal
 VNFK3z9rdDDKMvjUr5H8PiySvAzVOxw=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c018a cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=bgQE8YJmYTX2oDi9gDgA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: 5-TRhjYTNaAHng13_Mvu6iyqB3Rq3JWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240074

On Mon, Aug 24, 2026 at 1:52=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> On 26-08-24 12:06:27, Harendra Gautam wrote:
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
>
> Commit message missing.

Looks like due to spacing, commit text was ignored. Will add in next
patch. below is the content of commit text
"Add a dedicated MAINTAINERS entry for the Qualcomm Audio Interface (QAIF)
driver so changes to its devicetree binding, dt-bindings header, and ASoC
driver files are routed to the Qualcomm ASoC maintainers and mailing lists.=
"
-Harendra
