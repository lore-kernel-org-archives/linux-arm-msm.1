Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020719;
	b=vU9k3CndYVVyIcEKBnzMh5zErflk4H0KfcYs3ZyNxbHZkWxKUPWUoyZdsHybaeg6M2U3
	 YHywTpa0b3zLj9BbCXD6iux/XdsKDRqz6b+6yV4kbHZuXPX0zcm82Z5oAEzKg0P6uqgCJ
	 VjqatiJD1JHhrX6jmbwqgWupIi1el2Ccc7PS3P6PFipQ79tGJ7DGd01gHSvvsq/h6CApK
	 0mtHVytjhJ8cM5xRikZC5xX1vv10ioOIXgcaEsA9LP68C3m3wkl1mFNyF4v61s9Xlv+qo
	 8oPQzMXxpACwm0oxuQ/rUlApkbevEueK79gp4vKW56V/aEiAc29P2RDSLsNRjRGcTAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
	b=1BWo34jmdKmykklnDTl6DpH/JugVTZBtMuL8tx/O9pyYzcuaaFFu4csxA9ZdnY8gk07+
	 0SBPEkQQJuBe7kMkwYJ3U/OQ1Z+Rjn1U/JYXnbS3bIsYLEU+Y8FyKY0eWMTYFZe2bd7fG
	 hEFcp5A0tlzhCAbnemFedb8nedaPYv8kt2S27b4gDpIbhI9uvBNpLt54FhMIQA064mPkL
	 27zzruKSK3RTIJzzToHmbiJIZC7QPEamc6/cqSiWwguqh8yP1SFLUreoiaAgsx5g92UEC
	 pakWkUJHE59Dced4ef4jSc6ticnJz1Dg5A6lD0GjT0gi8eCfuw5OG6LFdQC8I9ZN8RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE68E606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE68E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lnFzD3aT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P0OFSJTF
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAsprq4131377
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9I6xBe+KeKP
	pG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=; b=lnFzD3aTrzxPY5Wg/QEwuxiUK6Z
	B3ngorPNEG4sNKZf3iL3h63Y2nkJgbNshFm0EL3Mf590BdT5fU9atqCiAOAf/r2u
	qcQSrCk2SY3QnySUQG2rsyhhMYHX90hI+tmjD8RmT+KPT0HQOQCHjZCq1/2QKPNF
	On+7JvFdX0C6h0uwx/2W5JAGUzXPFnbJ8jIrYGWtrrRxbHXH/OCE0TQB5wjwNIem
	iapwoZvWD5V+5ytuFfCqsW+Z/HCKXgWxnhCr0skrWazBJzwwNFCfzI+qjh3EJe0g
	XQ9LQ8KzKubgz5gYfZ9U6jjH8pfkDnYF1i6mjoaRCC/Vmjw7UW+WVEOF0YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0kj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 13:18:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so661209085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020717; x=1793625517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=P0OFSJTFSmirM306MS+S9otX9d2aGg55fpYmOAUnLgs04XVSb8LHQGMJYNQ4GsN0ki
         ODGTPtPhmFHoF+QwEx29V6ncBUxN4lidBGs8m9eHTzuQ2czFjib/+wcZyvleDozJWFwL
         TFuzZtJMpHufY1DJvYOD/s+udKmMfPrIYKeQdVxSPGl+zDVSGT2MafXQsG5zqAC2SfJo
         Jbw5MAH96jcuu/HSsaRfgmOrMAioElfroQp2C6FFxasHd1dvPebu+vLYfO6fmfr+UpTG
         0ktzWfTubfmp8s8eRUeFzW/yviEZ2O7Qtp4kSqSJDleSIIKlWj55/cGPT6Ni9Q3DYABf
         5b9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020717; x=1793625517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9I6xBe+KeKPpG0kwk+W1ObbWOXXLuZ3YNcVmBOf8+t4=;
        b=yypnv/WO3KBx4D/YKRQ8tf+/uHnyIoIw3cOr/yUrrFbBckM0Q+cdU0fnk8i0VqIXF0
         oIUK39QpDLQT6p/mrSm/eaX+fu9BMqFzbYwvpgKFT0Yg82uFy7tN2mhL3/CWIs02WqWi
         4TmJXzj/9fO8+SN3gCekXEHIf/0Rhcpg8P0n8FBlS4MEIyLM4wI55WboxrCjru8vjZkG
         ueM7faaBKKH9evNoyamABU5hcVdQutP7q9+Knjo/MApcazbOupV9rDJjg81Q2RTXLUY2
         /w5hMAbdjBiIghDkM5bmhCd3UUXLn4EkKgYnsbHvYvZ8RnoGbvxwL94zjbnXv1/G6CAU
         oOuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOmdbZqzAcJHk4U4G9xE5Dfa+IF8A6HBr8aYiNcjsVKjyFT89QSqksN6RzF9PzhjOmDia2k/PHUXuUWtBb@vger.kernel.org
X-Gm-Message-State: AFq9FYJs+TjDRpjA1wuMfgV0QZLxYa+ZS3S6LaSQFtYVedMYljRmLzIi
	nr1mp6CN7CAkcX56nfjq/vMNX6w9fAJAs8RFzSl4ES6OU/IyGz3p6HShoGPB4EVbKd46/6jUtfy
	I/L8iiQQQHnBi+GkGM/prkxOlMsSIbv8Nu/OT68RRlqhn9gE45gRyQnlCcRPuNHkD/cPe
X-Gm-Gg: AYBFou3QJ75XOn7NKho8oJi6HPRYtKrAyT4DOTqSXhGjL54jimPfUkeLFaO1ZCGlIeL
	J90EO38KfGTwvXRUr3FRhJ/e6EBgKP3bdFpRtfnOQJ1k2DSA4WqC0pMnK6zYwNOcEs4niSM/sP7
	fv2Z5i/lWRIniag94pnovOti0m2knjQ2NFFg9H3/8NsRIKn803tyiYbPFif5cuN1BQviYcRA9uC
	mpHRjNFwoKZ7ocgirOzbL7J6mG4oCm/3M/x/ReHPv8JqvHcbTS+fj2ChA4Yq248U5LsI4CqY4pi
	zTD3Pubn/L6qYKtLvdFUoiahgLLfrmo9hI852pob/5PHGbt7l/QGASnH2AgFwM1gN8n9fuCQCYV
	+Qi1Huber53jXR0HxdKC2Qjv3
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031765785a.44.1793020716828;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93c:c405:3215 with SMTP id af79cd13be357-940ef8f0a22mr1031760285a.44.1793020716262;
        Mon, 26 Oct 2026 06:18:36 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:35 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Mon, 26 Oct 2026 15:18:31 +0200
Message-Id: <20261026131834.3247963-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com> <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX2V/ATfK+yde4
 z3R9vDK9JiigekFYJKK9MtAp2EBLLTGV4TreWoKwF/4TR9e826A5gHnDzWFAO42stG4yhgcaTVB
 b7PdVUy0aLURbEkHGAZ581JfNcKAId4=
X-Proofpoint-ORIG-GUID: WbqZon9CdLqOlkHE5rtfIgWTjcDw7Gk8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX4SG/Q+eIsG4Y
 /wE6/2yT3UoRGpRZfrCG1sVxSv5CPbhJoPlfqqJDocfv3CatGRYaZt5RJPK+znItDLpBZNscJmb
 XauoFtDbHECufbVM6cRX+WqVFTbX2QskzFwELP/FoCggbG4+mPr4pF6sRJ2JMjFwJp65jAGjQKG
 hDgsj1LpTSooG7T9DRDmCsemln/fDfCVIFeX+Qbqkz6HxhSKV6xHCYvghBJX1PC2FpIl1xy25Q2
 ohTWu0hV5+JxyyTrKpHt7HyaRgNOD9Uu/AK7E8cc2qK1amcedt+7pDTWdxefLg1JAwRQgWEbiNC
 X9J1Luqzg9sRgBclRbtaMwLvRFHTKDRnkzNpI0UHGEsJTbHp4Tbx2CgycuEVjUj6ILN4kmmDBzn
 YBDBbbCk14sxDZ5fwmSPrpa0V6y1sOQ6VBpldXJvUirWb0qVztF9KXuHm5HwQwdQuP3n3JKYNJz
 aDAlceetftxmRR5Erkg==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf532d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=CA_on-7weURM0OGBZFkA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: WbqZon9CdLqOlkHE5rtfIgWTjcDw7Gk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On Mon, Oct 26, 2026 at 10:28 AM Loic Poulain wrote:
> But are we still comparing the pixel rate against potentially
> non-pixel clocks here, such as AXI?

Good point, thanks. Yes, AXI is selected from the same value, and this
patch does not change that. For RDI it is the line data rate (pixel
clock * bpp / 64), so a rough estimate of the write traffic rather
than a pixel rate.

A proper camera NoC bandwidth model would rather belong to the
interconnect work than to this series.

Regards,
Atanas
