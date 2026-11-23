Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795446712;
	b=5r9LQl+5KaA55B7jmhX9LSdavzJRPhjynkbrYAUiVVHBUON9DCjav/bYaZXbVMYFQ6ok
	 ZMLScutY989392SfQY24pf5gb0xaDojkHfg3Zgn2fMsAxoBhdrM4UavRIumqUgci4LfZu
	 a8NWs/YHFhCjN7WZmjjk0gKb8SYNl10XbXpY1Q+CRwYv9Vu/ooKiZ2psA0rYnVXdBHqp4
	 3vbj2+uV7tqeWYgUx0SP5OZ44CoY/K1Yk+oWe6ZPHVz+fA4ZjVGeXXvLv7b/Fssz1lenR
	 eS8y37F/bvdhrV8djqYoJVqBfTFRw/LaXqbQYK0+2OAVOAG21eSWdnBQVGpvor4F3mA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446712;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
	b=lPdXtm3FLuAR86mRuARboDfadv/qfO7QPtSfcdVE3vYOOv9wuHEY7OwVRzOyTDSuY/0q
	 QNY5tokkqHWtt+ekrWhIvLG4ZNhEzUQEqsHAEE4oMSvaG/OYCMLuDH654qSB7C1IsJtgl
	 3G5rhAGdco7l9nwmKI/Q6Z085TiimtZAH1AscEUUKHzH1Sfgv3d9iMSkLwFDOqsS8QJQ6
	 tXrNMm1SqbvbXmriap5qZPsdikLA5yThe4wAIO4YYJQkGW3NJJwTH/OUXKC7rkbr62p6h
	 lT8YsvCVkHydX0NFbY5a5vdm7n2tO04xSUHhJ/f/DyPQ0tnQ2pcO3Rz68ygeGxaM++Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFaUlr+h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Y7H/2t4X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B4606A687
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729B4606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oFaUlr+h;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y7H/2t4X
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLNAk445712
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=; b=oFaUlr+hqfy+qKop
	JPCZC9yZIZ8imH8ZDwgb8GuzrOM7A1lpRhc1QA3PBbV0saAjShH0hR+vdNnZbWsH
	7OcQbYTbhEloa/IxAJQDuGp4alVi1808PFBRC6sC/K+2Xp/eXrMh7AcCAS1SjpUi
	eHaZSkFR3dFGqTFm/9I4Gk7fsux+pbdi9xW7FF7TqDBttYSagEE04+voUwYupPvt
	50kwmluzsCqdwpT/9FS1mMATTbvYk6Eb7xteP5IN3gerTkGlG2nJSlhI/xqrMhDV
	e2BevT+AUUcSkdhTnYAn6Hheb7zA8gBJ3g7KLhpheQ4xWDfsbaK82MiwHHbxKow2
	Y5rK0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741ym7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:11:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f20addba1so545550585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795446710; cv=none;
        d=google.com; s=arc-20260327;
        b=mnvaDrrNH2TOFEDNh4RyOyYurwbDpre9iGnORtAJyvBUKWTqXf7glwC+NB69rm6U+d
         Pt+K3s3yccn3vS2doXk8RTRHUoaHSaW/nQJ41v7kbIMDs+WCD2cn7Y1a4BT1FyScUPi6
         AhBUMU0McjATJm0dFSgUCJnleawP0g5HO6jNcXlxGQZMl7yfILNR3h9dBsWptWMG9itS
         mmx/eQUykePHlBgTl7d/GKb52CBG9UFliqGKCO5iZPvHOdA/R9eaMc19i/5igm7qLY0T
         2YcwAmzPCwRVa1loQDPuD6HvtyKzTT7pp1EyUXjc+U6NNdKRMzVvTaBw+1I4+eg22YEz
         KXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        fh=uGZZW/QjO7A5hevjHoevCk6IL+FX+Nnack9hLbsOXS0=;
        b=GRiY8ZnujYZijts8Vl7p33oec3eP7YpSiiLsAteh/GQQFGUYW/vJPczvFggXG1gMBr
         UZUbRtmeUoXZZdmn+Y8D6KQ2j9NZKUtlfTxfroDsiBWP4mVKZeLOvAjJTGNLu65Ut+LS
         p3wOUnzKwrLEHlkAzKenCHqeQPFJ8qvWr3sKvIhwTtyf+Sar3gRk8jaFysBtFmt7In3J
         HArHY9ZcrYCW8S9j7LcSePepLAgZ7Lq06J/kDkrycgVqGy5JuqtSVv/eQSUHYthh9PN2
         63WStXjEnUp//SA23PWYkW3EKGDEdOwayWx+u09LyvvX+M8CLKP5iW5ls+AYFRpsbCJj
         i4Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446710; x=1796051510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        b=Y7H/2t4Xhwkt+Qps8O8dgBzxaCNubWEQ32Kly72xIuAoRgFSYTg4tFz1Y/L1/nNt+u
         BwZT481A3q2MUIjtrD+v8n4/yyb9uYmEp6lFbuIr72ph78Y4b5ILAmKHoJVncSz2n4yK
         uwyx85OEDhTtKIdHP98Q9jFVvBFy79+5aun1qWEdRVk70rKc+88AaH4RlmWcolqhjwl4
         ainBkvuDrYzILTKAiCu1GSjsOPsAWVTECNtuG8Cy1d4cWn+Hfmmuw/RJ9dq8kyfhuZyd
         7PUDCM1VeNu0MejXEUTAoReErMUmIDn8EV5/xBaBhIBWp+1qQAtO6kODC/1WLrHPX6Ht
         QUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446710; x=1796051510;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHYsXh2rYvgIaBOCoqtwMKCA2gezyD7SRqb15VXsvAc=;
        b=LcGD9VncUPvM98ku/JyP3pBR9ggVF4QrJlhYNG5aU9ZyeJVra24qkxBZ3UvqLX6nJo
         cpQMnSQcQ46BmEXNI4bgae7m/O+Hvd7Erj1NIzEi690l5kar2ToyESiQiEoYy4Nl9/WV
         /+VLIymHDkO41PKpgL8J45aMk18Ihx6+I7B0ip65ro1AdXnJErz7pykoKfFDv6vaAkLc
         20u/4VMPNVcjpD8oxAtCqmmg0+YWF7o9+ljFnWojZs/wNgUmeeCDtOP+rL2pcjMFI3fX
         cFSfF13lr/AeZTpndOVJVRj4QL3tB0AZD+ICPCq9fUbX+I2YRhFCgzhjP/JCG9Gq+H/5
         RtaA==
X-Forwarded-Encrypted: i=1; AL+hErEcBYjWk0DKcnkpQ31M0VJmq4r7VA0uxzbpRWGhHUcLuuGxWwTGicoQPL7TH307Sh1paDlWwt8MDUobm+FA@vger.kernel.org
X-Gm-Message-State: APuU4Z/l6jBkBPSJftv61W18djx+p6IFJYJyr9eddOZu/GQY5pPoSOx/
	R5iPeQszSSvOLKXlt38Y2gX4c0dtSGDxvnYOBpNyImJLIsATDr16weOJXr5ZIwvg+b91X0UFAcW
	PiZmV/GIjqKYhetlsS1oyAKci5RuUd6ysSNEKJ36gt248BvccAqtqF6AydoFuIBEKbaYgvpWsIa
	bgasx2XE7DlPqHP+KkiTJj29rfXoqB4wucqTXSNStNZ9k=
X-Gm-Gg: AZFdTZcBOq8l/B47zdyPm56WGgHF9eyE2Jj0xXu2reKALzw+CHTmkX39cp3JOLdj5Q9
	RppPHteSGdTCy1xBgLIHMPKdEVx9EzstI7K5RuKoIeurVODVIQKEiuWuoiaeOGT17Qr9E0lqqBh
	ERvMed3/8/+gqxkksHBUNds6cUz/coQZICZMZLBckdq51L4qaQfq2zK+UdWmnw/fYsYd/19XQZR
	A+L5cljgSPX5oDMFaO2wXK8sbWywcdfNM7IdC3faGSvj9H+ZnBNG72PkqkTnWQqDVnHDicL5Y0p
X-Received: by 2002:a05:620a:a807:b0:949:caf1:ff98 with SMTP id af79cd13be357-949caf242a5mr1281226585a.28.1795446709127;
        Mon, 23 Nov 2026 07:11:49 -0800 (PST)
X-Received: by 2002:a05:620a:a807:b0:949:caf1:ff98 with SMTP id
 af79cd13be357-949caf242a5mr1281222785a.28.1795446708608; Mon, 23 Nov 2026
 07:11:48 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com>
 <20261122-camss-fixes-v1-5-9df4deb87ea2@gmail.com> <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
In-Reply-To: <ab0a0ad6-4c5d-45ae-a318-dd678a5685e5@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:11:37 +0100
X-Gm-Features: Aa3M54pgT-2WfF3J-1JQ2P3V1nD92sRSWYlRVjghNjzcR4P5a3N9G-AehYNezoA
Message-ID: <CAFEp6-3ZE=kpdPEiRh4OwjsPoS7=OSrq9HMmuX7vBdct1GutPA@mail.gmail.com>
Subject: Re: [PATCH 5/5] media: qcom: camss: video: stop started subdevs on
 start_streaming failure
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: robertijtsma@gmail.com, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: GxxTvZcSV58IQTF58CTaoFILM0batli3
X-Proofpoint-ORIG-GUID: GxxTvZcSV58IQTF58CTaoFILM0batli3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX0nl5eKis/8HH
 PJu/RigiY5s/AGPmkCKl3rdgOufjK9S34Rm6A9wfxFLZ1ukld/mmJLYzgg9clIbM7VNttSW6W3d
 tehet84XK32hQullUavJsR7luxWHRzE=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b0457b6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8
 a=nqOTGbnG9gFnUC4tSMkA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX2TsI1RjX+ZTi
 P+Z48ejLu5OH1WiHUIx4lEiJdL/mjmN0PT8aXRhBTG97A1BACRWWUorbXNbyJBuXPqD6669SYnt
 wH4oswn4fYJzY+Lt0lHH3ZTYTy3/OvFkJ7hqstv8fZbZXiNj2hxWqSzHusXIs6uWQh//dnQkKKX
 8Nf+m5LJOXbWvmqCOEHUvpPAqtG/1YCtfgCQQ76uOOeCjX5DKWL1xNrxwZVcFYZWEmK8qp1BLAU
 J/lJ/8JXUbRq/tQaqVZNijLbmMAxml/W4Tb44+le5kgiGu7GdwJkx2QQi7wFl6b2MQGB91rLjOD
 srZKlyboA/iUVCLWtCzO/bdILpi6cmPQUAknYmjqYclARuG7cDCNzn8bEMiWyQ8/1yLvJOnPynl
 lfTD1RFjqwTVJvr0Lbom/byDpYHzFuXZjis/aZacidW1qA1Uh2II6swwgXcQC9cahdcVh/s3QF1
 t6+C4w5Bkhv/B2F1log==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230060

On Mon, Nov 23, 2026 at 3:57=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 22/11/2026 13:35, Robert Ijtsma via B4 Relay wrote:
> > From: Robert Ijtsma <robertijtsma@gmail.com>
> >
> > If a subdevice fails s_stream(1) partway through video_start_streaming(=
),
> > previously started subdevices earlier in the pipeline (such as the VFE
> > and CSID) are never stopped. This leaks VFE stream counts and write
> > master reservations, leaving the pipeline stuck on subsequent stream
> > attempts.
> >
> > Walk the pipeline from the video device up to the failing entity and
> > call s_stream(0) on each already-started subdevice before stopping the
> > media pipeline and flushing buffers.
> >
> > Fixes: 0ac2586c410f ("media: camss: Add files which handle the video de=
vice nodes")
> > Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>
>
> I'm 90% sure someone has already submitted a change for this.

Yes, it was already submitted, refer to my previous reply.

>
> Anyway
>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
