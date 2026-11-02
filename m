Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793632254;
	b=a8pvPj/bRrxgd/XQbRrordgCQl19lp6WAOOdzp2kc3z/nV+/f4s8vCp8y7qFqXMr1kSZ
	 uucE60XKPb52FbSLWckXEMq5As7ISO9DUKNZWYlzQVvldHe305yxrq6z4QNG7zRx6x/J6
	 xJ7FqNW7NzZnVlRDGd1gSuM6YBrbn52JXQi+na3bsAbULl0xPteolqeB+Yu/S2mDCKuX1
	 ApqsRAbKRDwfdEVdENACcB7es/k2xKQVxujkIEqo1fYXG9LCWnzf3Srn4zWL5OOm8V25R
	 dqT2GUt4O68iPlByXXXlJdZGAZNUkPLruWzqpeAzWC+5U47KcbiZlcs1S4VHgdh2sSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
	b=Ukkj2aoFjoEz8DmlKuQ4haGIW6QmWJQebmnUUgViG/c38Kqb9G7sXwread9irPZw5B9J
	 C1eQmMUG9I5fNHt+0vQ3QzwEkg5pTltB/t+gtx0L/2uP51rqDuA1HCy2a907xI3kBNBz2
	 9jXU4ujrjCG6WFl+xXgJq8BoUBRlBEn58THOxn/NHLqAI787ewge0V71kHQK+7oCaV+lz
	 1jXfFmN6kr0i0c2PVCxD1OiiznhSvq7J0JUbE8xvEUDwJTFJXsul16f6eLL+3Hi9Xujx/
	 MRW1pXa61iPHwV3EPwljy4RgMA6ecTHyUWU6IB+HnJaRlEiuX5sCeB8gh2RgWiK4Mdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Acb6Ao/k";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g;
	arc=fail smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C0A607670E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 15:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C0A607670E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Acb6Ao/k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TTkdNv5g
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpF8i3102559
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 15:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=; b=Acb6Ao/kD2+0R91x
	Z3b1mdHeDf24o/EhLrUbf5mmmJwueXoNJ0L79M9qz7jX8KUOEdAujv1tsM+b9bK1
	nQRyaJKOk3xCStxMevN9tQtZuGA/xjd+dGp93qNNKiciTFjOLYOGrnWEst2CpaCz
	qEpZJPaDXXqRgeQcjtflMGocW6BWY4OYuq5kehIn/SQWprUGlTmJacCFZvrePFev
	CVqBM07n7QOxBuGrklMUwqNTT7fEu0vPfRqt+wJHsxd4gR7KlOCx9k2HGLi8vggB
	IQfJJZrZNs5Wh6usomoXmnx0XOQZDhsMhOc8T2EQgpn+2hWaLtlIcYYUfQaZM3vU
	tFuePA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rje3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 15:10:53 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso4600666b6e.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 07:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793632253; cv=none;
        d=google.com; s=arc-20260327;
        b=nPSnpXXw8zNpJ2PEeAquA5AR4sHsz5o6zfLOe2eVBLeyhJntHpGVJUdFJrT/Wgkonf
         9gi/QG/lY+Fm6+jpkkVBNIl05wI78nJlve7rUi9hLQGoJQJlrvyVvOt5v0E6BXdGQn7Q
         ZRF1iYL3RUf5w32NUURKwUBm3R/DIx8Ro2YUjFBn45aPwZD+lezhFRxk4YAOwtOTUB6s
         0CGCUGeRzHFWR0tU+L0Di2ZB9oD0l2/Mxq5Mwcz2xdxPrBkWAp0n/QdyRx8o7HddOYwX
         eaaY72tNCEm6ouhzvrPc+MCKSx4fMdEP3ut3plhnwcIpEoErcbwzKfXRBzIk2koDb3hZ
         RJcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        fh=inVZPBkBTabRCQMZptPZv6j9bSqJw/lqwqxxAlYVcMU=;
        b=CaIEUGHW10A6lVr5E0SCd9f156nCxDZVbgTS0AnwjKkmHrG+m2yWd7sWiF4Zc5t3la
         vr4fcodcM/1XQns8pNzHIe+EBj5dmpIGqjQkUxQnXu6jOwifTUXmBY7HtzStBN/kL9SA
         xKPIb/AXbLiBqdLi+eKdL/V9DvXth+CeGYXQmKY2yb7TGFgblhSY4SO2gpWOJE+sK9zn
         8dLRKXAT3BJSYBT3B4lCo2tpEs8CLSoBw6xixNmTcrqn/7yL8H7hqrIkfN8akMYjEeZg
         zOyT1siejI3SXpWbmvfIJ5bu4Mji4wWFbMAK+l784JG1XzOWUJFzlZZ/SbbJXwA93VUv
         8I6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632253; x=1794237053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=TTkdNv5gRS6pA9GbsJRxl5LIcnBr8iIkhuV3FgkB3RPXYC72MRb0nLP3MwTIqbijIx
         HuCLJ+fbZPUayMjqtEJY6CeeKaMO3XoEI1Ip71zd25TmU6PVJM/vriDzbTOLP/K/7xlt
         W2CP71JDTqhr+yjkr4JoTyuzOI9BVyH0CpQvOmkpodiOKtbkwF+Gcy4aYpLzZA6rsbuD
         JHfER9k0jTH0rivr0hUU2KtldIHzATggR24xgBal1h+/gHedRzaSgARi8tlqsObTgoBo
         SNFP7IoMubK2v/SOpNSyyKNM6TVt/yqHuRzE/F5oWrArFDL+lYjQhrd20MrYhR9z2xcV
         bkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632253; x=1794237053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dEayqysTN2NKmyVRUIyyepfm3B+IXUPfKM/eivkS7tY=;
        b=2lPF/abF/qPKCXyi7aXxVCAwgVHgyIMqUhl6cE9c9OjvircK6JCUfrpg05z5t7bIy0
         lpsw0xOlHkYWiHSocQF8FaBiNknRwryGzk8tvp8mOq3VJTdIbVgnbBJ+NAw/xYLlAWAk
         wMilnda7lLhrGfdK3N2Z0HKMVjq3PShxxlzSSQsQAsBLah+HiK9xyQ1hcII78m4ilv0Z
         QCEoK7otHRyG5xsQQYQ5qY69N4uxhBID+2XnRsPwSdfTYlpQ2Hx1+rkScP8/JSluN6yY
         3aG0RmGcs4wN42F9ygTVXYCRne8uH6O/ALV1VMateVRJQ+R3myR/Zckeq5Y6o77eLVvS
         b0rA==
X-Forwarded-Encrypted: i=1; AKwUvBycRSSkJywiIIzrNTayczQZDrTDPw2eGNTZ/pX7+T1YR/1pa3koNEirupF/lJQlzFLUd36B+StZEJFopJ1B@vger.kernel.org
X-Gm-Message-State: AFq9FYIYHDCa94DHMXN8f8ejw06BSSxCyYQWz4uOpD1YeRDudizCqSB3
	hLBvhOil3vVWczKJ3RJ4amepSCXMrwqQOoS8GBAX4XgNs7m3nDmtCL1QuFSSiRNGtFT7w7XDjdL
	fXktdJYx1D1vOpsImsg4SAcCUswfHR4DdNcGynjfAWNZbAP9cGpmw9Ldak57/ZKl2yC3AWnfsKn
	ESreobCn1NTiBZv4daFRw5RZ5F3XfjB998jePYi5WzNXh+LcYgVGVL1o3B
X-Gm-Gg: AYBFou2OcfR8bMO/vSv8FK+Xv3UBWv+s+Mdx+niFV7YtnNIkJmW/+SqHVvZzZskuYw2
	bWY/xiqBGpYdRKz9znN9puZmHvtYjmHshE6Psv0n8ex8/6w6fW5fXEj2brty830Wcib81agwTDs
	NSc7RNW8/+zjlyYjNAW0g/SrZSfqDoXny/CEZdu4TONl94K955Uba7T2oM5V5pAK672xfX0SWoa
	K9Wz7bd7auWZ54/ncNr93WKmP8/ZpaEq2HArynWoSpH11s1jolyQoLgrjtUhhEGqLShlzUrMoI=
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id 5614622812f47-5640dcf25f8mr6442097b6e.10.1793632252670;
        Mon, 02 Nov 2026 07:10:52 -0800 (PST)
X-Received: by 2002:a05:6808:120b:b0:4e6:6079:c33d with SMTP id
 5614622812f47-5640dcf25f8mr6442070b6e.10.1793632252159; Mon, 02 Nov 2026
 07:10:52 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org> <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
In-Reply-To: <20261102-v4l2-frame-sync-v2-4-25cbed7a772f@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 16:10:40 +0100
X-Gm-Features: AclHuK-JQEWhxTCECGBwpwc7HhTmuHtz6VOr3jPQI82NvgKXWXXsfW9ieCjol3E
Message-ID: <CAFEp6-3FGuYO8TUtEeA_K12+CrVRPZ103KJz4AfFgCRFd65k_w@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] media: qcom: camss: csid-gen3: Enable RDI SOF driving
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX00rE05XDRuxY
 rAhYRn6UL+0H4Oa3mjCEiApLcJ4LCIZms3tLF+v6LRmR6Df6rFKRewN2fvaKuqp5CcmjQZ74Omm
 Rom+JcQ0j3lF3Ngl0v/m49m8RiktefQ=
X-Proofpoint-ORIG-GUID: lByUAo9lbqfyecYFctq9MGZdfuOdjPXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX354/kwyuZ4y+
 weIyqNV0PU+2alnFe61zIMUSGr33O+GZQTMsrpdzIPVkWFTFxnm3ti2fXXZd+slK4ZesToqEj6v
 YF2T4LLdCTEa730sxHNgDRCkKdWgd/tTVwa0scJFEQ96XJhMpk2B9KZd1aCL8d0vMpLSqnQhyiU
 UwF6eP7T1xLQJADSMgjvXCjmtVIiStVLhIPiB0mLA4l122gHz+3BNMBCjV8kujOmLXanP0JCp0M
 /RO7/vgW+Iza6Bnj1maiounVwy3GYP93YKuC8Khy+NUZBZvS9Mtj+2b/CZcruwbS+S5LUgppJsv
 A2Ep4bptfRJlUCuv/xVo7klH7NNjzLyF+vDhv+80uoxK//Uki0YtBqwEUCjiVQ=
X-Proofpoint-GUID: lByUAo9lbqfyecYFctq9MGZdfuOdjPXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 suspectscore=0 classifier=typeunknown authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020060

On Mon, Nov 2, 2026 at 2:57=E2=80=AFPM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Add in silicon enabling code to generate SOF and trigger the routine whic=
h
> produces V4L2_EVENT_FRAME_SYNC based on SOF per standard v4l2 behaviour.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 27 ++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27db..6a538d825f78b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -34,6 +34,7 @@
>  #define                CSID_RUP_AUP_RDI(rdi)           ((BIT(4) | BIT(20=
)) << (rdi))
>
>  #define CSID_TOP_IRQ_STATUS            0x7C
> +#define                TOP_IRQ_RDI(rdi)                BIT(8 + (rdi))
>  #define                 TOP_IRQ_STATUS_RESET_DONE      BIT(0)
>
>  #define CSID_TOP_IRQ_MASK              0x80
> @@ -58,6 +59,9 @@
>  #define CSID_CSI2_RDIN_IRQ_STATUS(rdi) (0xEC + 0x10 * (rdi))
>  #define                RUP_DONE_IRQ_STATUS             BIT(23)
>
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)   (0xF0 + 0x10 * (rdi))
> +#define                INFO_INPUT_SOF_IRQ              BIT(12)
> +
>  #define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)  (0xF4 + 0x10 * (rdi))
>  #define CSID_CSI2_RDIN_IRQ_SET(rdi)    (0xF8 + 0x10 * (rdi))
>
> @@ -219,6 +223,25 @@ static void __csid_configure_rdi_stream(struct csid_=
device *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable=
, u8 rdi)
> +{
> +       u32 val =3D 0;
> +
> +       if (enable)
> +               val =3D INFO_INPUT_SOF_IRQ;
> +
> +       writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
> +
> +       val =3D readl(csid->base + CSID_TOP_IRQ_MASK);
> +
> +       if (enable)
> +               val |=3D TOP_IRQ_RDI(rdi);
> +       else
> +               val &=3D ~TOP_IRQ_RDI(rdi);
> +
> +       writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +}
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +253,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       __csid_configure_rdi_irq(csid, enable, i);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> @@ -279,6 +303,9 @@ static irqreturn_t csid_isr(int irq, void *dev)
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> +                       if (val & INFO_INPUT_SOF_IRQ)
> +                               csid_sof_event(csid, i);
> +
>                         if (val & RUP_DONE_IRQ_STATUS)
>                                 /* clear the reg update bit */
>                                 csid_subdev_reg_update(csid, i, true);
>
> --
> 2.56.0
>
