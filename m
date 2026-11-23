Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795430494;
	b=wBvm9ZoBdsceUvTUclsF8fBnHKzskLQJuAaTlSHTHhrm2aCRdQsjyZDVGX20fHrGcMem
	 +g9kKI1iXaosv3xYnS7uFUUSGr21e0htC5j1JlUY9DtRVHV7iLGm8IUSG6eC4UJSzoeQe
	 3peBjpEbzJv49QuYIwZDlGEWNjtFAAqFXNO93FOz0yYgUsC8mx9ew/9BbXEiydSOHWGgd
	 L334M098EHCEMstbvXhXcgrT+M1m83WeZJyaAvkpX6eMl7etg42vsqZkA4VtA8l97nydw
	 gntNBFk857KnToNapDXUvfaiESlMPXve2CG5NvSGQLZg6vmvuAH+VfJauOXnWbxSdcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430494;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
	b=Thm6U2nymHyMJqlo89T9MtHkrBNMIJq21doVJLNDm8nZKXLqbo5CEIR5NmFoiSe+N6+Q
	 y0aasiqWVz2S/ikWWmzYurJy+9B9E17+avrK/r3MwpecFCNP0BFGREqJV9vZTfKviCTYa
	 XyY0RjDYUE4KybMLjttDxmZAXOLZdm6wFYNv/EVSY+dev7FdrilUHZtXJqT2o8PhEptBi
	 ROq3L1yKHKGsLTutXkgiCAIlZYAmMQwAIVHTEb17KQSE8l5BbqhHWOpOF7wpU72b1WJtd
	 5OO26+nWDRp4mbdzxnakgAFYU2XjhNfpYnVWt+q/ubFK/tUR2EJfIIxweaYvPerbElA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXL4C/Tw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB75606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXL4C/Tw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lv8chtU4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuFX2785560
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:41:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=; b=MXL4C/Tw4mJRyCmS
	/3p5pVKnE9YSURx4VBWSffV7NPCsb1eQwGe5wCJGoutqbiPziJG2dOwZ1d1EOmiO
	Fj0e28GKZquYDNB+ixNgS7t5kWFZlT+dicAGFFGH2n26WY2254ET/dxV9tPKsjw8
	tAKJctyF1vXmlEPUOzL/FCv49Ed2MMWEdLQB8U2IripixkCAm0Nf5W4JU12hc0ZD
	eyapXyta1eZz8hQPu4SyeTbBOdVB1utNJVzULLylzLeNjMz5jezX7zVOeBH5X4Xb
	rQd8Ffzj0FFz+VSl3KikyDhJ/DEV5s/I9eNRHPC7HNHRKl0J3mLBHV1rI0DGWOVr
	iR3gNw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd10ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:41:32 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b0e4c2f052so47558967b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:41:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795430492; cv=none;
        d=google.com; s=arc-20260327;
        b=fSGuI9672gisqRIcFxCvaaC/ULukrx0rmOLTIY7stDNQT9rJm+tO3Mnerz0J9gDmLF
         HJxVtKojlWT2DsDHxTtZJDmnTFVnlZJ1L2qzrTjFgmVjGwOFXSvJFouTrU4+hB1keGU5
         lkLaIqzMuhEUQ7kMacRhuSX2CJKcOrnFu2CmQMU7C5zbfHz/m5cxA+PKHLeu0SWvh4R8
         HE9UneQqceLVMgK+R3GNoHit7/OtrlJUyDVcq3mzXzuHKdwp0OUvfFrH93oxbaA2yAgl
         Q2yKlZVRhO9sXX6qyo1DgEZXeHksQdNu+LSLfwxSVauUu3DJeDBnf+0JTM3LuqUF/gor
         I5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        fh=2s92r9N9OVcd56o2QkitbLw+S8J/manZsnES2tCvQHw=;
        b=AvDqswmJF9Z+NS+ZbRgN4yEJy8jBbohh2Qstmpsi71kVXjhsmmv3fvZUO+fvQuN6tW
         rS7CUyOQZRmYZsECN5CqVZNXfkQPl15f1L7sNADsYSR8Ro45C01/KhZ6SWol1pa8Syob
         Co6P9XJpK2F+JRpfmgSa5FVAZ8VajEhSEW9JkeN0NrqnVvQgd2WJ+pw9ok+u3b5aiOQH
         d3VSdW0u1S5qiizpMeNnXPayZzXtPifFPpFTp0YmtRv17MSZG5/5S/XUOweKCzoi33xj
         0jqOp8ZTmVIV9LPsgvVGUYGBAMesC+I/uAaCmjA6MOQ+DddjJX1g7hl78Rh7LaYsZpYv
         hvvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430492; x=1796035292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=Lv8chtU4egopjHPByugmBHYt68mYV9sT6UnGb8LtCz2Z+tyBUhkJEZCyajUa9z+vne
         DMVUjc2yzgCDUkHb3HpQqMV1kAykX5Mx03SIHESvSfXWWmnyZY7EriripzhkcDTY3m67
         GwzCroB7DEwD2tn/nRKu2Z3y0Rk5JYelYDyp8fDlcZF2roe+9kO3UGVC0E8+oqXp7oWP
         gYMIQCMBpgoRoPKDGniCODt6DhOQpN/CjnMP/j4Mmg7raVXxMT+35Yebv7+ZVzGnv9cP
         OqT2i3Tm5mhs0VOPSSfvhhkVU5PuJhufr5rDqD/Vz15Up8Lq9RWLtRH47dXTAGrz3/h9
         WprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430492; x=1796035292;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27iEvKhRk31vKMnFYFf2M0/AFhO1yHWq2P+tmWU0YcM=;
        b=oYzrNOT4PM37TxQbgb5jR6LouAfX2MfATJiu+dF0KAjorEVejAb8u4jjsu773Dn/39
         JU2i7c9jHnxM0yBP31kiQ4+ubINyAE6drD6KJ/lakIRIbTEb9BADsm4uW/wgvqLwVg1+
         UeukZipLwxva2ZSrjSuKTSzq8LyQ6GGE2POSqF4WK3kTBdwOjkGAc3HHKV1xkxlHtuLB
         KfwXuG+Q6FmqyaLrWvLSRRS9vDpwSOAyqqcS5gVRwpyjZJtLGTZeGgM3XZ48MGGE5FdQ
         ab0pLQg/n4yeW/qCq2xd08jCtl4MMfrwDBpeD3ejZinNKOZXLBoVZ366cdJJrDQvDM6E
         HFlA==
X-Forwarded-Encrypted: i=1; AL+hErF/GP6qyshdwi+GZFlVkzqotnWytlxwonnKJrdeAJnz+I3xjqIsDFzQAZnHqHpwjstoRfRsna6K5w3O8J7c@vger.kernel.org
X-Gm-Message-State: APuU4Z+W/mceF9Qh/MMKQnyksEJTisPkzDeUgbLB5yw2IP9lIXZ1TOkk
	vE5GUVRtdYVgm34G9jhkERuV74fNlUKR3mFDC8hicBsoqYNlM7VS5exwZImYHjNBuZ0jr8vBelO
	xfok+doMQgVjHsL4o5HvBBzrU5iXojlaqJez6tKmZpsCsOGOdrO2zjsWbR/TNFYw7ih9NuDJLiG
	B/l2nRLZg+9QRZwURZXPBqPpvJ3SjXelnssqK3+OJiRnInZmCG8Qav2w==
X-Gm-Gg: AZFdTZcZivs3wR7FnNq+SGwDxXhPnykvqjDjzon2gX0xeKjy3TEuEU69mS3pE3oRnDE
	5VxcCjNG2X6lOxEa8AvdICQ22bKYNIDAAnyegapOxBCpxh0JGLicpSV9kbNMNxv209ZNANugZVR
	gS/hd0FvgNpb7Tr+eYOqFWt6arq6OwunoUyhMTY5YvU1jxOy+PNHjlJLo=
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id 00721157ae682-8b520518c27mr42200217b3.67.1795430491772;
        Mon, 23 Nov 2026 02:41:31 -0800 (PST)
X-Received: by 2002:a05:690c:6104:b0:8b4:cd2a:b70a with SMTP id
 00721157ae682-8b520518c27mr42200177b3.67.1795430491400; Mon, 23 Nov 2026
 02:41:31 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
 <20261114-qcm2290-eud-v1-1-b6157b817377@oss.qualcomm.com> <20261123-crayfish-of-splendid-courage-c63931@quoll>
In-Reply-To: <20261123-crayfish-of-splendid-courage-c63931@quoll>
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:41:20 +0100
X-Gm-Features: Aa3M54oHmRt3xfqR24IGlW8Kt6ZRAtG-3k_KFIjDV4TNG0tPhafKEYvoA79oUAU
Message-ID: <CAPzfCAary8rkKeF+XFRFShRiy6GZwh_ky9_mo33C8+gGSxRnMg@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: soc: qcom: eud: add the QCM2290 EUD
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: k7lhsT7lN8clQp00wbBhtnnBq2781vwH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX+kQdWs302L7c
 Ud0RQg7+nDIhtILzZ4lh7Zt/S1TMtsfiEQT9SI69Df4Hi0gDPw+m1tSxyDF3s/g2l5T//itRhko
 M52yMKL20IJ45SOG0lFd7m+F+t5w9v+9Zo1diHMrNlCgFpLarCk9B63KVb2FqC03OpcOSMH2v0C
 w4xmJuCuIH1IGi5TMnrW6tDZPLX8p6xJK7+6GACCnHbAdhjSvIuZc3WhVCvYa5c1O8po7298YPL
 jUxEPFonh4wnIVs5zH6bjndkrhqd8f6SqXQrlYk2s4K+NkAIr4xc64nUqbkI4RKkPDdf7DeGpxq
 MToZZRQLB0bnabVHeshsMfT5AYz54Ur7dW1lhLeFEZfD3wD/FOldojP22M19/SR3tWVwWLzrJsi
 D9aEvk3pqAROJ13mPlIg+QeV/yCMhBrf5MjlaWINxSEQ8C0vjokdm1kNkLBtW6EMxfRY9po0oRS
 0FcDwpu2AxQeSvwpeDg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX37j5RG3Ptzjp
 5z9Fe0KS1MYKBHRXJZb59LdTl1enqCanagXzKv9ftmwOmELCxiGynZFKu2nXOse5jj0IBxWqtuK
 /VwLI4b4dLx0M0oCGjh9AgE9fHhJCsg=
X-Proofpoint-GUID: k7lhsT7lN8clQp00wbBhtnnBq2781vwH
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04185c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=AX2TNvW1BK4AuF6XdYAA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

Hi Krzysztof,


On Mon, Nov 23, 2026 at 11:22=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Sat, Nov 14, 2026 at 04:39:04PM +0100, Igor Opaniuk wrote:
> > The QCM2290 has the same Embedded USB Debugger as the SC7280: the EUD
> > CSRs and the mode manager register that the secure world writes on
> > behalf of the driver. On QCM2290 the mode manager additionally ignores
> > the enable unless the TCSR register TCSR_APSS_SPARE_REG1 is set first;
> > the boot firmware does the same before enabling the EUD, and the
> > register is written through the same secure IO service.
> >
> > Add the compatible and describe that register as a third reg entry,
> > required on QCM2290 and not allowed on the other EUDs.
> >
> > Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> > ---
>
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

On Mon, Nov 23, 2026 at 11:22:21AM +0100, Krzysztof Kozlowski wrote:
> Feedback from Sashiko looks reasonable and I do not see it being
> responded to. Dropping from DT Patchwork.

Sorry for the silence. I just silently agreed with the feedback and
took it as is
without replying on the list, I was planning to send v2 with the
sashiko's warnings
addressed.

Is an explicit reply to sashiko's review comment expected as well, even whe=
n I
simply agree and address it in the next version? If so, I will do that
from now on.

Thanks,
Igor
>
> Best regards,
> Krzysztof
>
