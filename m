Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FBD426432
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556051; cv=none; b=CSHqMiY3JqDTvHH5TcyJ0MWHYkkimHA2EqMXVLHrrGJK7AAChu1RcRmYztZR0pq0U1UF9dwtbr39XDcvJ4OQrKlfai2/MwrDxy6dYOeGAo/oEKY4koaWUuPUJsK37404boXw8JLYEZgYs4gWQb6YIuAw+DKHdEbZXu8IfjGBhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556051; c=relaxed/simple;
	bh=ars068aHZ1zh6r3O6lVpEYUVNtKxsXYVCmqzKpHYpXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tiNfU3y9gdRut+9qkmfkSdxVKJsV0A1sC/RSO+wwC/odSn4hc5l8B1wogGAMhyBajDdE6IgUnTxyi1AZWrGj2Lly6iU2rPNqee+kqpVxreJlNYsO9RLCTWcAHkD+gj8HkAvBnvZzZiR2x4pea3h4ZEvq8B56oLGRrZmPf8zxdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN5JDXm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGJjfrWd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN5JDXm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGJjfrWd"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KDqPPs2745323
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fEZu2O1SGmwVg7wnNzlMQJn6
	s9vJAsCWIlk1lovELsc=; b=IN5JDXm0gn7aUWNX+Ve+odkyQbafQdowEygyYYOn
	pxzrMbHownBEMfkaIDEO39iHHRtMmbHj1dnxja59lCNK7PsL5UzHgURD68ePvsP8
	uev/ZklUqUwPTqY715T9kjB9HRdA9hmk32Z3FCAfjDSzBd7KlCTq/21WwXoc1puV
	UWigTwtBZ/bQ9rLXVQuH6LCuANLtG9dEHFHct1ayl/MPAO0O9xAlYDo/f7MQYJ15
	+fQAqaE9YkuNeTaoQUSiEf9UEmDl2hwoWYy3uVyIl7woQvmBht7aGs0nAu6WsOId
	9hhMJ0XSVxJMoDoNC+hDhpk567sQwmXGjf3d+u2Bb0vr8Q==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhk2f8j0m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:00:48 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4488f192768so11412131fac.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 07:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784556048; x=1785160848; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fEZu2O1SGmwVg7wnNzlMQJn6s9vJAsCWIlk1lovELsc=;
        b=WGJjfrWd25gFhRJAp1/UhZnGUvsPIaJ0l1qr8pt8Y4LtobFeGhvat0Igp0oDXeaDNM
         SMeohXoPvd+lh8w32dAwsHMFjFyFNEoAoMmxeS5HJiuOYuNNWi7nh0E9/hsai9yIw+zq
         /jGDyGcvfeW8Juer089lRNrfGzJhIaa7oIfQRauwKQ9mQYE5tZlCsDblaXG3XsOytbXa
         BtOjaI2ZOuDHCNHBn7WIEtonTAmDLqUUIN4TIGeIkKq8Fp+njfm0YGXCj3jUNEkK1U9W
         vekgiulkneTBq+Np9NAaMs/mZohGO2UyQuQX4Q7Na7oFpiCkIJH+TwQYTlssm8AUv8xb
         ddqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556048; x=1785160848;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fEZu2O1SGmwVg7wnNzlMQJn6s9vJAsCWIlk1lovELsc=;
        b=T5atMgTbMvK3bi2OCHxemhp14BbKsS0it2v4zlKoiwf6Vy/+IlvtTSlc+COtWo/sv3
         d0LJPla6WeVbwACDMKxXkY2vfr2VeT9Rk+StASlDzr9bM3d2YwVW1G2EFHu/KvhZN3cL
         iyr64eHFt4QWaXVvbtR7eH7fGOOwxKtvq0wI0kAOsAtshS7kj+t9r4H4gkKRcM14pq6y
         DotgfiZJ1pStqvrm/AUWS7NehBgKaiOxTVWHB5zCDEPjtEuLzdKUjKt5pHesy+PJQHUL
         fncV+hGcHSLxRnaRh09kx2PliERaEh23ELVAE6/JCzZMZSfub9JRTqpV9cQQ4/X5Ce1r
         WscQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBgs0EjZtEn44GHEIax/Mnr0o5n8RKXCnohf8I4bl4j4K/QgIb+IL4BmclEZfw7K5bN9fYt9w+tw6VgBcT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ873WhlBvYp6sRrT4FPWZWeVMqGjGbyVL9RvRvoISL7t631AF
	7cFfOLAW/3eAZHyL1CdMxD3OLSP5pk1h2wejVYIaP3uK1QJereeIRxJ7gEQGmLV3u7AaUAiqzE2
	gvhKrnqjyjg+0p4RnRgVPEW33LTGdburU6D0tmOZMceDmg9/ERTialbQoxqQU/NUQ0eM9
X-Gm-Gg: AR+sD12u6nuYV6949sXG6WZK5MvqPrMd8EMh7BnaWJYIdiqx7yI7WuQVgS0Sgeq6wSm
	4FGBqljbwReon+Szs38rouaBBTtBqvdNy0/21BnJivKOz0KUoIV1O+bXhfDbCwK5U4hVX2i5t0Z
	SA7QleAQ/fGlwoES5zkt+3IRhCo96TWLOaZPynoRD9spyu89x/wrSaml0MM8Pp+NkrWl+/+Ib4f
	qUncfhdodaL+ne/l1a7Mrvj/ro+2Fi26bk17Dk598qBBgNUpFVTjiVIoh8Ntg3nIvLvGruC9S9Z
	8snUBQuNl0HPflA4rljDBTBjfl8vYdVdo8u8KNXKjkh2gMoNn+nDL6stGXuG0drOQXADeppGFWj
	qNTrPxoMHMjDOaV+aznuWuq7jPB1KGYYtlvj2rlzFd7M=
X-Received: by 2002:a05:687c:235b:10b0:456:b3d9:336d with SMTP id 586e51a60fabf-456b3d9398dmr3529619fac.20.1784556048234;
        Mon, 20 Jul 2026 07:00:48 -0700 (PDT)
X-Received: by 2002:a05:687c:235b:10b0:456:b3d9:336d with SMTP id 586e51a60fabf-456b3d9398dmr3529568fac.20.1784556047507;
        Mon, 20 Jul 2026 07:00:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4568e6a92f5sm8537588fac.15.2026.07.20.07.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:00:46 -0700 (PDT)
Date: Mon, 20 Jul 2026 22:00:39 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride
 board
Message-ID: <al4qB8gIyLSjPBGS@QCOM-aGQu4IUr3Y>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
 <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
 <90769e77-c311-4a4f-be37-09065e217f55@oss.qualcomm.com>
 <al2iDH2b_YxdHfLO@QCOM-aGQu4IUr3Y>
 <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d5240c7c-6450-489a-97a3-c774deb129b5@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: n1a6naI1Aj1w_lx5QprqO54qYhCKRJMq
X-Authority-Analysis: v=2.4 cv=X8xi7mTe c=1 sm=1 tr=0 ts=6a5e2a10 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gi19r5wPGwIhDG2GCIMA:9 a=CjuIK1q_8ugA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfX2VGj1EFQ2JBw
 lYim44NxqcPgQReMhWBR2kURZ7XbRwN6Zu8lVPQq4q/SYZssJwBMLI5Flo8sdw4hqKQ4atK1fs1
 TPBIL6BX5KW9l+QDZUtpJKodSqKMxck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDE1NSBTYWx0ZWRfXyt6qQxg9J35M
 v6kzmUTvfYamIWb1yQH7hmvVA3yxDiqW2Sidzr0ViJ8RSn+YD97jZ3SC5GObSvFr5rlKSKu4gtw
 js+P3gLpJ9TRN9SrhSBsdmbgUkmT6pbZrd3L9lbpfbuydOxFX5HClZzzmyCdpCsaK3vIBFX6wdb
 0FOdCLmmVnp2M01r9TZzM0eeWEYnG/PTYqX9cRNsRGw3x4SDWxDiyfzddghx7/IzlVz/VFM7AAW
 8zWEpAO1w9D6DzdK1kY+F06ckyciMzFeNG3T3GFFxopTJWMau4SHpA177mkVN83luFDE348IfEP
 CNLadkWQe5SVYlZ5hrarTLotjZERX1PU/9Pj+79vgqq28xt2sF8NpTa+GRXRJ5OFhLi5FjE6ht9
 LkGxQ4rUHhxahtm5YBnxaJ9VcCFmJ8WicBfwhGcwR+7DZXD9cbAOtfXtjj6rjYHYsV9Y19phInq
 MfyaQOPOvMADGu/9Drg==
X-Proofpoint-GUID: n1a6naI1Aj1w_lx5QprqO54qYhCKRJMq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_03,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200155

On Mon, Jul 20, 2026 at 10:40:09AM +0200, Konrad Dybcio wrote:
> On 7/20/26 6:20 AM, Shawn Guo wrote:
> > On Thu, Jul 16, 2026 at 07:14:56PM +0200, Konrad Dybcio wrote:
> >> On 7/16/26 4:26 PM, Shawn Guo wrote:
> >>> From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> >>>
> >>> Add initial device tree for the Qualcomm SA8797P Ride reference board,
> >>> which is built on Nord GearVM variant.
> 
> [...]
> 
> >>> +&scmi15 {
> >>> +	status = "okay";
> >>> +};
> >>> +
> >>> +&scmi23 {
> >>> +	status = "okay";
> >>> +};
> >>
> >> Why only these ones? Can all of the SCMI servers be enabled?
> > 
> > These are the ones that have actual/enabled client/consumer devices,
> > e.g. scmi3 for ufs, scmi11 for uart, scmi23 for thermal sensors.
> 
> We normally refrain from enabling resources in the DT only because the
> OS (really just Linux) doesn't have the necessary support to cope with
> the ""complete"" system description. In this case, there's a firmware
> layer drives everything and handles on/off requests gracefully
> (hopefully).
> 
> > We can enable all the SCMI servers, but I'm afraid that cause kernel
> > to map shared memory and issue SMC calls to discover protocols (like
> > power domains, DVFS, resets) that have no consumers, which might waste
> > a small amount of memory and boot time.
> 
> Please give it a shot and see if there's any immediate
> problems.

Sorry! I have to take "We can enable all the SCMI servers" back. I just
tested. It seems that NHLOS ABL doesn't like the idea, and it
fails/refuses to boot Linux Kernel when we enable all SCMI instances in
DT.

I can try to figure out the cause by working with Auto/firmware team
internally, but that likely takes some time. Can we address this later
as a separate topic, so that the whole series doesn't get blocked
for v7.3 merge window?

Shawn
