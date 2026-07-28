Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600F33A9D83
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231112; cv=none; b=Eylv0rzFehHXuA3K17fV5SnjX+hdw0zTFK3LQDpHMXb8wVQ3VdXnxlu+iPY6yfttR8A+k+xqqcYPCsoZ6hZRBHDoEEfDoDSy54UCz+DyGnuPMR3i28nF100ZaP8u3TkEi9HmyOIsfIMSbyeFHKJxAf70e1ZScC8cBhl6sov/G7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231112; c=relaxed/simple;
	bh=/obxe1Vb7NFTaioTc0WNXa5Lkv4qFvuJ2105wMCse8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyE5UwO5ZnbEMErEF1bNid/mep4LujwU6o8AwhK6l7WS2pTDDXmZBDz2GRHEV0C58gZsIvlhKTCgUlgdOKtVzZlPag0QqHv6upWnIbvfhCd0E+RgMA1/m0iNKzfrgx/qyKzigq/cPAzI3wOlxPYN+1BEW89T+uA8mvVJJUwlIVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XB2gS5sT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bwTjZj7n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XB2gS5sT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bwTjZj7n"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82nAU2309805
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=x1Z67kqGGzp/351X1MKH582E
	OuE2QOqRdpP9R/VwDZc=; b=XB2gS5sTrNvwZxI4lCixwjKTHncOUw14DfqU7qpt
	JbrWatVN3FPNOLbquOjVSPIy5WZTtW6NeOHVopjOtMU9r6heI/SIQ5Ld4fZUgtYx
	NWy/L1yeGp/hinJejoW6KaIGqBl7pcJI4FnnX1unmRn/RuL95r+zuakGnkkF5Pom
	dZGvsdUoAqCJGBdT5aa2d/Hgq9Hd4p9jfeZRynzG/w5FkwYRyRuGHPVAQRY/qxAt
	nf8L7kPXHoM3ZEo+ItlaPerdrOzKTxzOFGjnMtV7F5+rRzT8AkwB6oRrgNtZn4wG
	J4QhFJYOnPuvurdxCZuMP9bsK9/Crg0NxSt7vPhoQLFiAw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7j1bc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:31:50 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso50310385ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231109; x=1785835909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=bwTjZj7nU1Mh45XMyQfovOhT6ey+a0Q+J90ifjFpi2iNtUtvHD4avOG5wLx9RClR4M
         Id0/Cke1vH0MzYv+IlN04V5OUWKNYGyQ0roTz1yCXvxILjJmd2y322dWdBXBwIGrbxHV
         4DrpWyiWTBDZKOUrV7/dav6CLEoJRHgBpht8zfB5axkCyDqUaYyKYzRPlX3Dhp/TyfxN
         FC9xv8DdGH4C2yISnIO55KuC53lqxN+LLj/ZfcTfmQX5ivSoju+kCxDXr+URRYrMPVJ6
         OH4gaqrjzrqAsaxRpXE+mEo3pqv6gH56FcuKKOTVjkcSz6bqa/KP5L+UevZ/hQnxvXm3
         sq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231109; x=1785835909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x1Z67kqGGzp/351X1MKH582EOuE2QOqRdpP9R/VwDZc=;
        b=rToXEjSWRryDqeEPeakEPO/nafDFr+hSeydad/Qsu5x7V29GlbSGz1UjsLQIsKjlj6
         mqpfKWRh3aVAVd5+1gz7UjyBAp4h/+BMPEslRZ0xI2lRO57Ew3zgkY1iTFSGxFVUn1f9
         bHBxftFbxlEQu/x3ch2i9qsmdFi8QzqWpEfSZbnHUVEh1FH7JuDzb73KsJjDRJZwWN61
         ViCAaPT6ndF5UPS5wQmhj3SiBETYWYvv0Z7Vof9XEwsf9WK6CGxvKKmkCBofU7mq9pzk
         ENwf2U17OYf3zk24B+PvI29XjNbJH4wDW7AnYXAIttbhJszQs6yl0xxQZPqanciyFQ40
         zzPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgBKquBfAeqxTU6W/S5e1BdQJwRfe7HKh17AFquP9rsBrmY+RsP09rr2zzlb9zJ+gVHl8NH/gLnTTUfdMC@vger.kernel.org
X-Gm-Message-State: AOJu0YyiHH3HqT7opyNmA6HT7GEJDUIrqwKGerK1yQRjSYVEn5UgYGbn
	xo2vAALY6cP9X7cgOb3QmV6x1gxyy0suDkKrdjwpTMSFPR8Tfrhnm1jpPLy8ZZsbQim14G1m7g+
	ncZmSTYDdt2om+DYNSG37FgnSOk3wcFFl8H+4p1FZVc3yasmfaYGgOLvt9e6XtDZhSVzI
X-Gm-Gg: AR+sD11gPB1brMyE0FjKbawguiYz10LU8Uf4ieHvUdMKC/ZZjgr7WpSCXMfVYzhtvrD
	fDhBNR6BfJrWwxg8WZ36io7sQqUNKuj3poX/6emmatzw0PLCQZ0AsDzGPaXqMCY6yv+vaiDd74H
	fRyRFQZmXwvLZH/eUcioIa9/X7A+1D0YlLYzA8qLRMe++x3YSO2kauQY9LKdsu2m4aou30FoKhz
	qllYmPu3QL1BIe75yfPp2d6MiRj9W3zJ49H37EBEWZ5VSut/z+BvlKcSWf3LOVsi8QtofAZXksA
	QwK7mSYohyfX2KU9TsZYvMq9hyGHTfcIfdkIeHLkd+6q4r02F4MP8GkiwrFm6rLl1ANi7SvxmR9
	gZJTnePeAaJ1GxTkUZbIg1LMVFpElzN4/R0Qqc2nZLgA=
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856785ad.42.1785231109204;
        Tue, 28 Jul 2026 02:31:49 -0700 (PDT)
X-Received: by 2002:a17:903:390c:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d015db9a6cmr18856465ad.42.1785231108765;
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm48841915ad.39.2026.07.28.02.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 02:31:48 -0700 (PDT)
Date: Tue, 28 Jul 2026 17:31:42 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] remoteproc: qcom: pas: Add Nord ADSP and CDSP
 support
Message-ID: <amh2_i8Z-_gn6tdB@QCOM-aGQu4IUr3Y>
References: <20260728084012.685036-1-shengchao.guo@oss.qualcomm.com>
 <20260728084012.685036-4-shengchao.guo@oss.qualcomm.com>
 <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a66d7a8-91e6-4aa0-a650-b951fb5fafba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX91gcKxwHZTZK
 +WUX79lcjbqS4CH+U8dbF23Pn2PsYR2q60YaYQBynvCoq2b1RPTutZ2V3NX04wjYE9tab/+qo5O
 2m1BuZ2Ixtd2ipcObpLV3PiaVr/wD6UYX1CxYCVYoI0VN/QwuezfRhyt+OpItbMGR3I8M0QY0nH
 E5ih44TB+mXtVFin68SKOY9aAJ5ri56GoGSBLlXAKfxd34gnkmofOV9j9rbrsdz6DyHkvcinwyQ
 KCrhWQPlbrmUW8b5o8yOyRujtMqxE4zSaZzjsNiNw5dGNbPekXO4v+ge+c8OlhBIfLI7HI/wNb5
 y4ECNQ9GEhLmIiIBi5KHX4hrwIThqb93gOI35RoVqOZ7srQmDujgpw0etnU77EX2rh7R6xUtSON
 lypniwVp/fcrj/Lr8KDMaCGUr5JCwu+bMka2cnE2khPb7CAZVzEExC8g29BmJh6hn+8nscLAdDg
 73dqrdELl6bMcfVaZdA==
X-Proofpoint-ORIG-GUID: UfUgb1_phf1oI2H8h7eAMg3XndLBUWTG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX3oJS6l2yGozr
 lYv3LGYyyL285AQWs5YCstAAsCIwTGJJG1dgHbyGYUspC8vsR84aiufCVK5rrLGgtBj8x2uYpPm
 tjhyxxvhUdZ8y91/KgrTMFlp2pr0NXc=
X-Proofpoint-GUID: UfUgb1_phf1oI2H8h7eAMg3XndLBUWTG
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a687706 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j4koS-U5rW7OSw6DyBUA:9 a=CjuIK1q_8ugA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On Tue, Jul 28, 2026 at 11:19:56AM +0200, Konrad Dybcio wrote:
> On 7/28/26 10:40 AM, Shawn Guo wrote:
> > Add support for ADSP (HPASS DSP) and 4 CDSPs found on Nord SoC. The ADSP
> > is pre-booted by XBL before Linux starts, so set early_boot flag for
> > attach path rather than a cold boot sequence.
> > 
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> > +static const struct qcom_pas_data nord_adsp_resource = {
> > +	.crash_reason_smem = 423,
> > +	.firmware_name = "adsp.mdt",
> 
> Please use .mbn everywhere

Ah, something copied over. Will update.

> 
> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Thank you, Konrad!

Shawn
