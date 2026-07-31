Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5439EF05
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785487415; cv=pass; b=F89LBGaP32hhD5aChmuSLKfGJS2pbHaZ8XrmV+dFMLzq8gqpgsipfGqgMYSNvVO8YlpCUfZpulLRIOcFitTWzJDFKGPUDrksOL5ALKEcHJL4phgAt1UVcr/UwJR9kgc+0nYVziBCdLRCkvzpD/p7a3tNghhN3IijIMgTEBbCIdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785487415; c=relaxed/simple;
	bh=7d1cX0sJ5aGvmi/1aLIuxAQBrGgBRvV38RLqGwGH4BM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QkI/UrWKZH3O9tQetTtqEL8+7Pd9pHhiJgm+jA1Q/fU2UitVE0yWL8Ba8t0E6F5mGTN55zyJEGggUK1YLplMNE8qgvctjO2vTsgo8ODhglUGzvn37Kq7CYdOsx270bhWH4Uc/02yE0PT+d/ka+IVGmI8t/7whRpptDHmRGAnKkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vqgltm67; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hK/Pczgg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vqgltm67";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hK/Pczgg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8cLvi481698
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=; b=Vqgltm67AGe6H03K
	3UZdm7UENlGOTEEsNjQsuaFyjYDY3WhDv5gT93rwT2kHNoDitSCf4OctnQxOOImm
	AgixAlEps0gNL+ig3eFTmk7lOQiF/2B+9qO1dU1iMCZaTWXmCy4pEbrNY6X95LFw
	RxdgApAtNWtcLsS/wsWJ3cJlEQkYpwCLwT1/kOBJLX+uwf1NinEjYHLaNWEB/URq
	jmMo3icTNZeijQ9Mg5FtHtb2/dx3PWIANHxwB2VD9f1lBHKq/C2IMLfMyaDtyK4l
	Us8UHmG/0RNCD98LNRirVpyPLOvNVlPFyeT8TMFrxF/uGlaJ8rqN5N21hsnvS8Z7
	hatSuA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrc8g0p6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:43:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93494527488so86857485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:43:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785487412; cv=none;
        d=google.com; s=arc-20260327;
        b=OLKi28FpPya7jc8iZQzGc/Y60srxDgB3LlLsd8oinUUsNVdgHhNi0nVJ4ERqNoCqOg
         STgX6hEmLVzxIlpGEqU9pFMVyqekMEtQx7iCrcAB4ROfK5wdOsvq3SVPG1ylKnv8eOsh
         6Rp/TFWup1PGkuK8dvauNQEn4LJ76V2C6gK3nWUbug8GTCcTwsuUZYXOUHXv410FkDZa
         /P+Hpjzu1QChAgPP1k+EDMpOW+pdlVJz6tNJsTKxgc/F8kUYfMhmh/8BNAONzc47eP1A
         r4H9BD1uIffiHrxV1BxyLIT+f/UvH5mv5WGpEmgxCdRliwo3pCVXDKilfn/xkSq940LG
         oRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        fh=NM9CO/Rl1Zl51AmmkGzqYmhyGN6KUQWVFhHJEVJwrhg=;
        b=ZZRjfinYjZ1iDrOa4S3rxisbHpysynaARWLieodE8VcZUZyEWcChkIXQntilZff/yW
         pXw3EABpody4NvUgK+OQ+Wku+QfsX6W4CowYjulGxMMhV6SOuINPhC6OlD1qAEEA/i0S
         I8yZplKi7IqesPem14ief/frPT1nbsGZsM8Inya7Ci+SXTGa/ci1dMNrxBj46Z0H2VAO
         97yVxfA/HSdwSIwTFqmjMLDwM5N6+s62FV/lRGDpuN7CZsrTwF6aPk/0RzeYigtWW7rw
         ixeiMrPanFtV0s91RIgKfXlXfk9bY+EOku9xnQGG0awx8/Ydub4lr1zNUVZ4S/fijWXj
         rKDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487412; x=1786092212; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        b=hK/PczggUq83e5C+4TAnCDA19tSsDvHOLZbQVErJCkrmqOUqgYaX2s5JntRYU6eJ6u
         ecObKZV+NqpQcdPr9kNp1s6wQeC2Nmr3IEo21tgN/CqeS0ivLjU2U1+PJ7Mh2wJKWcg6
         tBmmawywfZvzlH8H7a7llJBZLe3ouDMsdcx8hAQqTYE7QMCnULEH3A/opqocJ8smHxd6
         AGGqdLsTnb+LIHyTZGMoi5nGY5yjKWIJJaA+9FxHxvoxcwkXAc4ieEIvvIPcLZim9qUR
         UAWxHcz8j914OJgXXnKI7KJvYKWGUAOIWpT2v6lEFma1Un17PoBZMMMO+HGHE78YRJnL
         6K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487412; x=1786092212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3GhF007z7C34wPcyFeCCGV2WXEPpkpmeiHbGxUATr4=;
        b=feObt00c8lC5cAm82YayG2RSrvHLnWU8E/AL5sjsUXQG0TnejAOUUdjIRghV2uFdy+
         d0/ZWfKefn5t5EjA3P7kOCXSuHb6aU7JopSgJWJ1UWL+S7p5qoLB/1efV6WjIyLsVRRL
         anbg7Zjbag9L+xIs2YBfTufSn1Amz1l8N44CQyX6v8VI9ZuqkEudjnD9AvIOtY+qDvSr
         0doK/ySAQjzMYxV4clu0fSds7xCfmUKYRaOOhfPBn7Fo5baW3KAhdFr7VNjJYpoM0BFN
         viogN1Fr2EVQeVN11UcDy/HpkiMH6A3nk7p1dUCNoE6sB6ozH7ZtReebFiebcCvdp4pw
         8hlg==
X-Forwarded-Encrypted: i=1; AHgh+RoZWs/Wuoy42YCwKj3O3nBqpAcimuHG8nQykycvTS2n0OOaaLklDm++9erRBu+ei9l0KhD4Paamfmktqv0S@vger.kernel.org
X-Gm-Message-State: AOJu0YztbUWY4bdXi9Q4AFkxaxGbKHcIyoQ1Wv2mbJirvyy6eaoGs/3c
	ltKW88G9Hq5RUI3Nj2fzqQb1YqisOTe2X9Vf2dlILznWnhrIfesnpbhTQN4C/JsDhgrLwX2mBJ4
	W7rMkG/IIGdWQyZLOEVf1oQQHljhypJqexoFs17a+8cEdnoyoD9dmb73OghpC0BPIosvZ3cy1Ur
	kmTZQUd4kNhNnjggLi7YeQeTcVJ/wPoYB1VtoRk60f118=
X-Gm-Gg: AR+sD13KmY60WTCLoEkDlLq6Un0zW4DC3pZhlUs/uy3tljIhN0UiKWQPXXO0JohmQuL
	n0AVgMYns2QZ1CnfHUHbUWbfW55VqD3cSHmDAURlHG7gb0sYquhKdluujDowGh0/gW8NGek0E7/
	rVSx1vOlReTrMJ8aoF5dPl2TXSAUChHI54X/tKFj41pJ36KCc+b50NTlgIYD87x/8a0pP631Hm2
	QBdBjOaJxqvggNpMb5sTMKmZOF249wwiCScZg+2umJp08VIRwkfj+bSFT+2js727qTSW9Vf7GA=
X-Received: by 2002:a05:620a:6f93:20b0:92e:9ceb:24af with SMTP id af79cd13be357-9349687363bmr109637285a.41.1785487411885;
        Fri, 31 Jul 2026 01:43:31 -0700 (PDT)
X-Received: by 2002:a05:620a:6f93:20b0:92e:9ceb:24af with SMTP id
 af79cd13be357-9349687363bmr109632785a.41.1785487411292; Fri, 31 Jul 2026
 01:43:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
In-Reply-To: <20260731-pwrseq-vote-rename-v2-1-480357946e00@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:43:19 +0200
X-Gm-Features: AUfX_mxGc8TowxqJoyMLr9lPewvGGZuHpNOlIMfPw74Jd7bPqJDpwbDzy4wrrSI
Message-ID: <CAFEp6-3X+PCXZdEy1p47XUDs7cT16JDjt0=928Jjkeik_haaQw@mail.gmail.com>
Subject: Re: [PATCH v2] power: sequencing: rename pwrseq_power_on/off() to pwrseq_enable/disable()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Alessio Belle <alessio.belle@imgtec.com>,
        Luigi Santivetti <luigi.santivetti@imgtec.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Chen-Yu Tsai <wens@kernel.org>,
        linux-pm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, imagination@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-pci@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jIdj91VLscc0O9Jkw9-7jjKLeTcuKncj
X-Proofpoint-ORIG-GUID: jIdj91VLscc0O9Jkw9-7jjKLeTcuKncj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX5iN/6wNbM6v5
 xhRo/gtaEurPlsKz+xZ2zsCGdpoVjNrGj0yW3J5O7mnJ78YbzLL6HthRxn25dZWNk3mpGJxcuwa
 nF0Brz1BYT4LDKtRPPzLSkcNzwkachzcsuMqSNaxxSU1Z5mPRpVB0KGzbrfsRh9zrDKc7NFLMFm
 ABv0IzAgTuZ9DNl42TEe0Uydy4jL1boM0iMnf7tcOSXJEMjhFAGE+F96GQ14M/+sETrjKBSbcp3
 ioeL2H6gl9YAiYMftkFDdddlPkCQ1q0TmU4PmgX1RFp7Ep1ZKRW7TpSllXkxnA+uq2S6DE8yGNA
 iohq6uVo0VmSWNdljfPNddi3pHaX/DjJdQ0E/ATxHfmGbB47TB5ClFwxfsIHiN+9eyRXO7D4wC9
 YmJpTYOOajHOBL2RqOEtkBhiCLrxSoei6BVfGmrTYuEr/LzQeT32xwtoCUpWVB59p2qU+f0Gr1f
 rLOQLnYzrayi8j77HPQ==
X-Authority-Analysis: v=2.4 cv=EcL4hvmC c=1 sm=1 tr=0 ts=6a6c6035 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=W1t4AYViT67xggANpSQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfXxUuVwJ8pp2Ln
 ez8Go1D4aC0izxp2kYmqWk8v6C203hki84Fml/TuaxS2Omi0I5FUj6M2oMCEzEY/rsK1b6lj9nd
 +fF1pClDT0J0HiWXxRPbLnKBkK5sB5I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063

On Fri, Jul 31, 2026 at 10:29=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> The way power sequencing works means that a call to pwrseq_power_on()
> does not necessarily result in the pwrseq target being powered-on at
> that time: it may have already been powered on before. Similarly: a call
> to pwrseq_power_off() does not have to result in an actual powering off
> of resources: there may still be other users that requested a power-on
> before.
>
> We will also introduce the concept of "non-controllable" pwrseq targets
> soon which further increases the disconnect between the naming
> convention and the actual semantics.
>
> What consumers of pwrseq descriptors actually do is: they *vote* for a
> powering on of a given target or retract that vote. These operations
> could be called get/put in line with runtime PM but this could become
> confusing since we already provide pwrseq_get/put() for a different
> purpose. pwrseq_vote_on/off() also have been rejected as unusual in
> the tree.
>
> Change the name of the two functions to pwrseq_enable/disable() which
> better reflects their purpose and semantics and also mirrors other
> enable-counted resources like regulators and clocks. No functional change
> intended.
>
> If at any point users need to know *when* the exact power event happens,
> we can provide that information in the form of a notifier.
>
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
> I've floated the idea to rename the two pwrseq functions from "power
> on/off" to "vote on/off". I've sent a patch but the overwhelming
> consensus seem to be that enable/disable naming is preferred.
>
> I'm doing it in a single commit that should go through the pwrseq tree
> with Acks from subsystem maintainers.
>
> [1] https://lore.kernel.org/all/CAMRc=3DMefxn81d0VUwmQgwFtffkL1=3DEr_1VQZ=
CbC1Sa-Qph4t1w@mail.gmail.com/
> ---
> Changes in v2:
> - Change the naming convention to enable/disable
> - Link to v1: https://patch.msgid.link/20260727-pwrseq-vote-rename-v1-1-a=
2029aeeac65@oss.qualcomm.com
> ---
>  Documentation/driver-api/pwrseq.rst      |  4 ++--
>  drivers/bluetooth/hci_qca.c              |  4 ++--
>  drivers/gpu/drm/imagination/pvr_power.c  |  4 ++--
>  drivers/net/wireless/ath/ath10k/snoc.c   |  6 +++---
>  drivers/pci/pwrctrl/generic.c            |  4 ++--
>  drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c |  4 ++--
>  drivers/power/sequencing/core.c          | 16 ++++++++--------
>  include/linux/pwrseq/consumer.h          |  8 ++++----
>  8 files changed, 25 insertions(+), 25 deletions(-)
>
> diff --git a/Documentation/driver-api/pwrseq.rst b/Documentation/driver-a=
pi/pwrseq.rst
> index ad18b2326b689a41471216f3889480b11768ca82..0c315ab1138b02540fae60b39=
928c580027c0f7c 100644
> --- a/Documentation/driver-api/pwrseq.rst
> +++ b/Documentation/driver-api/pwrseq.rst
> @@ -50,9 +50,9 @@ Consumer interface
>  The consumer API is aimed to be as simple as possible. The driver intere=
sted in
>  getting a descriptor from the power sequencer should call pwrseq_get() a=
nd
>  specify the name of the target it wants to reach in the sequence after c=
alling
> -pwrseq_power_up(). The descriptor can be released by calling pwrseq_put(=
) and
> +pwrseq_enable(). The descriptor can be released by calling pwrseq_put() =
and
>  the consumer can request the powering down of its target with
> -pwrseq_power_off(). Note that there is no guarantee that pwrseq_power_of=
f()
> +pwrseq_disble(). Note that there is no guarantee that pwrseq_disble()
>  will have any effect as there may be multiple users of the underlying re=
sources
>  who may keep them active.
>
> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
> index 345f602e9ce233a0934a73a85d1e7c17c4f3210d..e713fc06b73402ae3d57794ed=
0870df8394a796a 100644
> --- a/drivers/bluetooth/hci_qca.c
> +++ b/drivers/bluetooth/hci_qca.c
> @@ -2259,7 +2259,7 @@ static void qca_power_off(struct hci_uart *hu)
>         }
>
>         if (power && power->pwrseq) {
> -               pwrseq_power_off(power->pwrseq);
> +               pwrseq_disble(power->pwrseq);

Nit: s/pwrseq_disble/pwrseq_disable ?

>                 set_bit(QCA_BT_OFF, &qca->flags);
>                 return;
>          }
> @@ -2319,7 +2319,7 @@ static int qca_regulator_enable(struct qca_serdev *=
qcadev)
>         int ret;
>
>         if (power->pwrseq)
> -               return pwrseq_power_on(power->pwrseq);
> +               return pwrseq_enable(power->pwrseq);
>
>         /* Already enabled */
>         if (power->vregs_on)
> diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/im=
agination/pvr_power.c
> index a71d5b35601e7b996428312028a4c0542a5b1350..031fad8adf4f4843e852000d3=
d6ba45d0e4b0aeb 100644
> --- a/drivers/gpu/drm/imagination/pvr_power.c
> +++ b/drivers/gpu/drm/imagination/pvr_power.c
> @@ -352,12 +352,12 @@ static int pvr_power_init_pwrseq(struct pvr_device =
*pvr_dev)
>
>  static int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
>  {
> -       return pwrseq_power_on(pvr_dev->pwrseq);
> +       return pwrseq_enable(pvr_dev->pwrseq);
>  }
>
>  static int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
>  {
> -       return pwrseq_power_off(pvr_dev->pwrseq);
> +       return pwrseq_disble(pvr_dev->pwrseq);
>  }
>
>  const struct pvr_power_sequence_ops pvr_power_sequence_ops_pwrseq =3D {
> diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireles=
s/ath/ath10k/snoc.c
> index 3106502275781d32d17a45a661362206144df6b3..d7e23971fe1da99f6b5f7559d=
62d04e2044d8950 100644
> --- a/drivers/net/wireless/ath/ath10k/snoc.c
> +++ b/drivers/net/wireless/ath/ath10k/snoc.c
> @@ -1025,7 +1025,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>
>         ath10k_dbg(ar, ATH10K_DBG_SNOC, "soc power on\n");
>
> -       ret =3D pwrseq_power_on(ar_snoc->pwrseq);
> +       ret =3D pwrseq_enable(ar_snoc->pwrseq);
>         if (ret)
>                 return ret;
>
> @@ -1042,7 +1042,7 @@ static int ath10k_hw_power_on(struct ath10k *ar)
>  vreg_off:
>         regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->vregs);
>  pwrseq_off:
> -       pwrseq_power_off(ar_snoc->pwrseq);
> +       pwrseq_disble(ar_snoc->pwrseq);
>
>         return ret;
>  }
> @@ -1060,7 +1060,7 @@ static int ath10k_hw_power_off(struct ath10k *ar)
>         ret_vreg =3D regulator_bulk_disable(ar_snoc->num_vregs, ar_snoc->=
vregs);
>
>         if (ar_snoc->pwrseq)
> -               ret_seq =3D pwrseq_power_off(ar_snoc->pwrseq);
> +               ret_seq =3D pwrseq_disble(ar_snoc->pwrseq);
>
>         return ret_vreg ? : ret_seq;
>  }
> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.=
c
> index a7e599d841e6289db161b19a93ba5a61d9e0ab1c..d366883355173eac1a2631b73=
e5e041666ac23ad 100644
> --- a/drivers/pci/pwrctrl/generic.c
> +++ b/drivers/pci/pwrctrl/generic.c
> @@ -29,7 +29,7 @@ static int slot_pwrctrl_power_on(struct pci_pwrctrl *pw=
rctrl)
>         int ret;
>
>         if (slot->pwrseq) {
> -               pwrseq_power_on(slot->pwrseq);
> +               pwrseq_enable(slot->pwrseq);
>                 return 0;
>         }
>
> @@ -48,7 +48,7 @@ static int slot_pwrctrl_power_off(struct pci_pwrctrl *p=
wrctrl)
>                                                 struct slot_pwrctrl, pwrc=
trl);
>
>         if (slot->pwrseq) {
> -               pwrseq_power_off(slot->pwrseq);
> +               pwrseq_disble(slot->pwrseq);
>                 return 0;
>         }
>
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c b/drivers/pci/pwrct=
rl/pci-pwrctrl-pwrseq.c
> index a308bf4b5fc01d23b75db4cd396201c3ba3fe695..2a6f46f6e2012dd985b657c97=
c85879ba13b5133 100644
> --- a/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-pwrseq.c
> @@ -56,7 +56,7 @@ static int pwrseq_pwrctrl_power_on(struct pci_pwrctrl *=
pwrctrl)
>         struct pwrseq_pwrctrl *pwrseq =3D container_of(pwrctrl,
>                                            struct pwrseq_pwrctrl, pwrctrl=
);
>
> -       return pwrseq_power_on(pwrseq->pwrseq);
> +       return pwrseq_enable(pwrseq->pwrseq);
>  }
>
>  static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl *pwrctrl)
> @@ -64,7 +64,7 @@ static int pwrseq_pwrctrl_power_off(struct pci_pwrctrl =
*pwrctrl)
>         struct pwrseq_pwrctrl *pwrseq =3D container_of(pwrctrl,
>                                            struct pwrseq_pwrctrl, pwrctrl=
);
>
> -       return pwrseq_power_off(pwrseq->pwrseq);
> +       return pwrseq_disble(pwrseq->pwrseq);
>  }
>
>  static int pwrseq_pwrctrl_probe(struct platform_device *pdev)
> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 02f42da915985339d3de507fc36dd158b0035a99..34d5c0af6f37bdbfa9d656d95=
795d38cc7e38762 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -708,7 +708,7 @@ void pwrseq_put(struct pwrseq_desc *desc)
>         pwrseq =3D desc->pwrseq;
>
>         if (desc->powered_on)
> -               pwrseq_power_off(desc);
> +               pwrseq_disble(desc);
>
>         kfree(desc);
>         module_put(pwrseq->owner);
> @@ -874,7 +874,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *=
pwrseq,
>  }
>
>  /**
> - * pwrseq_power_on() - Issue a power-on request on behalf of the consume=
r
> + * pwrseq_enable() - Issue a power-on request on behalf of the consumer
>   *                     device.
>   * @desc: Descriptor referencing the power sequencer.
>   *
> @@ -887,7 +887,7 @@ static int pwrseq_unit_disable(struct pwrseq_device *=
pwrseq,
>   * Returns:
>   * 0 on success, negative error number on failure.
>   */
> -int pwrseq_power_on(struct pwrseq_desc *desc)
> +int pwrseq_enable(struct pwrseq_desc *desc)
>  {
>         struct pwrseq_device *pwrseq;
>         struct pwrseq_target *target;
> @@ -925,14 +925,14 @@ int pwrseq_power_on(struct pwrseq_desc *desc)
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pwrseq_power_on);
> +EXPORT_SYMBOL_GPL(pwrseq_enable);
>
>  /**
> - * pwrseq_power_off() - Issue a power-off request on behalf of the consu=
mer
> + * pwrseq_disble() - Issue a power-off request on behalf of the consumer
>   *                      device.
>   * @desc: Descriptor referencing the power sequencer.
>   *
> - * This undoes the effects of pwrseq_power_on(). It issues a power-off r=
equest
> + * This undoes the effects of pwrseq_enable(). It issues a power-off req=
uest
>   * on behalf of the consumer and when the last remaining user does so, t=
he
>   * power-down sequence will be started. If one is in progress, the funct=
ion
>   * will block until it's complete and then return.
> @@ -940,7 +940,7 @@ EXPORT_SYMBOL_GPL(pwrseq_power_on);
>   * Returns:
>   * 0 on success, negative error number on failure.
>   */
> -int pwrseq_power_off(struct pwrseq_desc *desc)
> +int pwrseq_disble(struct pwrseq_desc *desc)
>  {
>         struct pwrseq_device *pwrseq;
>         struct pwrseq_unit *unit;
> @@ -966,7 +966,7 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pwrseq_power_off);
> +EXPORT_SYMBOL_GPL(pwrseq_disble);
>
>  /**
>   * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> index 3c907c9e1885dc2958043a9a733fbe20bdf95f6e..5e94b0b9c38b036fc40e3e2c8=
c6e1020d0d0bb6e 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h
> @@ -20,8 +20,8 @@ void pwrseq_put(struct pwrseq_desc *desc);
>  struct pwrseq_desc * __must_check
>  devm_pwrseq_get(struct device *dev, const char *target);
>
> -int pwrseq_power_on(struct pwrseq_desc *desc);
> -int pwrseq_power_off(struct pwrseq_desc *desc);
> +int pwrseq_enable(struct pwrseq_desc *desc);
> +int pwrseq_disble(struct pwrseq_desc *desc);
>
>  struct device *pwrseq_to_device(struct pwrseq_desc *desc);
>
> @@ -43,12 +43,12 @@ devm_pwrseq_get(struct device *dev, const char *targe=
t)
>         return ERR_PTR(-ENOSYS);
>  }
>
> -static inline int pwrseq_power_on(struct pwrseq_desc *desc)
> +static inline int pwrseq_enable(struct pwrseq_desc *desc)
>  {
>         return -ENOSYS;
>  }
>
> -static inline int pwrseq_power_off(struct pwrseq_desc *desc)
> +static inline int pwrseq_disble(struct pwrseq_desc *desc)
>  {
>         return -ENOSYS;
>  }
>
> ---
> base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
> change-id: 20260727-pwrseq-vote-rename-b7cd21032668
>
> Best regards,
> --
> Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>
