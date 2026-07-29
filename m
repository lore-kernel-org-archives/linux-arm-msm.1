Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC14A199949
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785324940; cv=pass; b=MxzyIOalPyp/gMFKX38ga1cgfKiEHutxH7CXkVhqJke3Y3/Yh1Azp5klUa1vjVQa0QJaTTeuUXIDrlx5eC6Nk9manwVz4hAHb2ASFiW1fyK0gsej+XZGgaRGKy2E0NseiFaIKYXVm+pfZAFFSRD1icjZrBfB+3/hvnvxBG9n/3o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785324940; c=relaxed/simple;
	bh=C3VfRcT+sZcCo/DQKkIcGwGNwWmfsfBT5Zt9pBRzoPM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jq9CA4S1bZk4a1e3LHiCludsOSoUbsi3euVtsH3ou8thfTVeswWdUo6CjXoEqpWdc0r6bkGuoKH0VqLSSx5iMJDMuOGVi0P04VWO8P3uhGmhCXPx6LMepCtTx6fPwfwjik1v6Qm057ycEJpGe8t6qw13MIcdtA7P32INnp5HG/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FD8+Aead; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evOXn+Oj; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FD8+Aead";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evOXn+Oj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBZVAm1592715
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIJLeAnQsHAofyxe1GOfsiufaRlLhGM0oKTM71bUBWc=; b=FD8+AeadImKoU9lE
	h3LKTSn0HRGdhr/+UmIEGM1IEKDQiKH1deZDa3sdGedO0CFy2qRQHbRKAePS8dhs
	ZdKCc/eUwxMTPKNGvzMonmSyzOO4DKkXgoL/Oaf+eQdkhp/owgoqh7InB/33NC+8
	RlsOMp2KZdi/Vab5XifvBhtaCp5bf223QOXUKMeTX1/WTE1VG1NQC4hkiHuTbggH
	EdB0A85xHSFwofdoYqdOvgTPXKNyESro53sL+XAxRDQtYIO29lRQpRJjr7RyrLXb
	fQgBGnZmwiEuJUhmg/zNwabz8PMtYHwEUj/5Y/eY1F3aSl1aQMuKnFNgQlZd43pQ
	REz+qA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgsf001w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:35:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93106d8affcso83536985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785324937; cv=none;
        d=google.com; s=arc-20260327;
        b=PI6MYjqY6yozEIILO0m452/D0+khNx7kznqWOpUVfm6ayoC4yjsdQe4A9yDH96V++Q
         bOhwkXmcZqiykrRzFWS1qSnUU7rmG777pjZOSsJLrMCz4w4z2U7F+eFtByqsNY85/eMB
         2fokezX17b/B1skylynzRyY6rjDE9ttfYLkMsxw2WxUOCc/e5bOmGHnnP3+ARKpZ9NDF
         MNPn7uS0y2mJasLg9owKjgZ+1XvJp1jfrU8+I63Af5Fz6XdPe7/C75h/Vb6LGihiJVej
         GmpDYV/VPPBn1/VNZcNkQT3ZntFL1NJVwhHj1P9tJVWAzY0ghThXmBSdqbUf2fJZbVAC
         JBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MIJLeAnQsHAofyxe1GOfsiufaRlLhGM0oKTM71bUBWc=;
        fh=wVbNBizevBZ61TgRMu5rhRXVtfp9P51Gh5cOHDE834o=;
        b=LM8Umumqw/Ugjpg1+QKHjcHHrbgdwFE37NarIErSTHN1PBnOqOe83g8tedt8E9fqzU
         YuAwoNq22FN5By+yDB3TCGiwnc9ZudDpxE4gCduY7PZrmGs9W7rDXN122kOEjX3x7X93
         AUN6x3cZH4qkyVNuKnoi3Tx0Lu4J7Ut3hU0VX4kn8Esyy5pFf6OU7Ai3E4r+baoDFBSm
         O9OkAN43dBnM7qPCTjRa85/9pyW7mPpawS50s5C/JB6Ms7aA5XY22i9CDiKaxJsyboEE
         0rYrNb9bQdj3+NRUm2+LpctzxjBIuvGZe0dTtkXWrdyPiwIlQO918qiiJn0hahjeCvLe
         QvwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785324937; x=1785929737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MIJLeAnQsHAofyxe1GOfsiufaRlLhGM0oKTM71bUBWc=;
        b=evOXn+OjtqC/znTPs14eCYGQQ6RW3RGs7pPNqXhn5F65nAizL7Z3R+q0jaGr6g4ka+
         0pdsHjZQN2qQt0lnzjRlClukru1qR04jTsLohqE6Gveh+cDog1DNuIO1Wto38g3Ylwl5
         9tOxijFbsTNzB298bQgkorSpMl9OPAJr2VrxzcS4iUpmx2AQ6hYMec9cF1nqbwQOyq9t
         jvG1VhcG5cSS15fosd1NgDQxO+hMbfeTpsnsKUq9n2Nj7m2Y01rWh3R9taEWFOz1urDw
         Y9VAwHec4MDKWx8fyDs+Pq7p/6DTenueTjApRGMd2bDyP6swaUprcsq8EjLO1T22feHl
         aUcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785324937; x=1785929737;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIJLeAnQsHAofyxe1GOfsiufaRlLhGM0oKTM71bUBWc=;
        b=QU0DlPPkEVLkoH4wGoEFrQHrwfE5darT7K55NJZFl6YbZNyO4RH1mxecPOH2scjHne
         rGrGPL0tqpyxNKxn25ARB5/vPb08fdfIf/+RF0OjNwtkqAvGzboLFMDE2rjQGdsve2QH
         OqzafJ3l0ufM4rqTcKzwXKvWzdLCnNI3025v6joAiOSncA+BCn1atQXR4LqVX4mQK7g6
         BYpM1iIEaLPzfQTUC2Z0c/KLg4XR8jzyANeAgPaEXNzNaFz/UX9AUUEcDrLcjz+Yw8dt
         FT/tVHfnZEOuZoFDROv/vS9+YhfDNIi4wpwBge9dDEqddNAqkUKC13eR/hZGfDjxvpaT
         2quA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2pOYnD4tQa+DWiOLgJN/Jz/PydtxlI4giYQ46uCV04Zaj1GTt36q+3W6OEiKbaxW1lqLqJeZxO2rUreeL@vger.kernel.org
X-Gm-Message-State: AOJu0YwKuSwMgFIaYrHlkBvuWAnubiFW5QUwyOWls6Z0XHbFgkJ5KSYf
	uJtN/2oYdQc5XS1t2YhBNv5aLlJYXppA8nQR5r4HVH3oFTXDUkIuQummWREkM71bssSUbPwxBh1
	IJBgJ+e2u3wgMAOm2ie+H6iCcJxQ+fqDapg/zVcSe+nMpASdz0wddG/1tsmBm9S7cxZdQzs0hNa
	dpnhWiK0/l7h9uY9jo0PnQ5YiVol4iUgKpgQU8zpmkPKKMeChKI9s=
X-Gm-Gg: AR+sD12IiOzQYytj61MOAHtzaLX+GvH8sOZsAa+1TTLXvDbbzREvgMq7L8wru2ZsK2m
	O5LIrCug/ct/i+m9sO2oj8tSeBMV+8cAfqsz8eUeAFVUzb667y3oogLN+kuNhbCvwzaD90w5EQ+
	HuvIChgKV0bfViexhX0nUl3osyb+p1G2HMcgc2sLIDda0tN74In4IapqlZF9UbXhajxw+C4y2j+
	E9Zhu615YawQAtnrs7RYYSZBEaOMeCxHTj1m9xx5zEwqXmAPlBcXraT/UZZnoEaSrVqW7gz1B8=
X-Received: by 2002:a05:620a:370e:b0:92b:67e6:8ad0 with SMTP id af79cd13be357-9330272a40cmr620254985a.74.1785324936673;
        Wed, 29 Jul 2026 04:35:36 -0700 (PDT)
X-Received: by 2002:a05:620a:370e:b0:92b:67e6:8ad0 with SMTP id
 af79cd13be357-9330272a40cmr620252285a.74.1785324936085; Wed, 29 Jul 2026
 04:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-cci-clk-fix-v2-0-c3958f28b045@oss.qualcomm.com>
 <20260727-cci-clk-fix-v2-3-c3958f28b045@oss.qualcomm.com> <9fc0577e-ce2a-43fe-85ac-e382e930d5da@linaro.org>
In-Reply-To: <9fc0577e-ce2a-43fe-85ac-e382e930d5da@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:35:25 +0200
X-Gm-Features: AUfX_myQFTsRFeurmOduisqWnALh9oOceQK1Qw7einicpQvlHeEihgTLrOlfag4
Message-ID: <CAFEp6-1tvsg1gNHYwiyaBWqw2=bQazwRViN4ia3VHz9VWNOJjg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: qcom-cci: Fix CCI clock rate enforcement
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5NSBTYWx0ZWRfX/e0g4OZR8Yub
 7qze/t9zYSnQF1yBMfURcly1yWnb+pTg8RkvCwHBFQWPjkBGJqe5+UTAALyTpzhIlxjbQ8tLgM4
 nSoNKOv8Vyu75Go8CbFLL8RA91nddko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5NSBTYWx0ZWRfX0qGmZ5sFdPp0
 4eSa68mMQG+HVBbFmrBEeYJ1gsbHXwqTZzWJZW0igT2j3zNYqB+KBUhT6Dbp664XMIgDxs2TYIV
 ajwaL8+m31nw+iTlixoUR814GKF5OVFN2jFPGjFlro89PyWR/7BAvNJfrRHxGidIwDgeiqZV4X5
 7g8Wf4crlTRHTZoGCKzC5slAnbc+nO5pJdS2OXPfjrU8OYo/75MY5U5r8gCFX0ZGcLKeIRfENHA
 SCLfERAlGDrph6XKrSdkqWikQvIcjDX2vMviQ/f1hfcDW6cf+w6AdkDGebO+QEIjKf60Nx4NlEj
 5laIp3gJwculdjLKsS5wiD2TJ75vEM7EE0yOelAnYgE5d5nSR7BvT+BtXMzMcx1lolIAy3HNOGq
 eoFKiN8AOwwdII8cQ1gw3eQPF1+R5tjL1Enx8sExFJW07kiGlN8fScxzidciKR/U8/9+56m+um4
 IyyFOxK4doVwti7HVWw==
X-Proofpoint-ORIG-GUID: Mr30JuIiCujW2qbZdcgUgEdNv7BSPn35
X-Proofpoint-GUID: Mr30JuIiCujW2qbZdcgUgEdNv7BSPn35
X-Authority-Analysis: v=2.4 cv=NdnWEWD4 c=1 sm=1 tr=0 ts=6a69e589 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=hEHBz4w9bolPAqnzaVcA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290095

Hi Vladimir,

On Tue, Jul 28, 2026 at 5:58=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic.
>
> On 7/27/26 12:21, Loic Poulain wrote:
> > The hw_params timing values (thigh, tlow, etc.) are in CCI clock ticks
> > and were calibrated for a specific clock rate per hardware variant. If
> > the clock is running at a different rate the I2C timings will be wrong,
> > potentially violating the I2C specification.
> >
> > Rather than just warning about a mismatch like before, actively set
> > the clock to the expected rate, using the OPP framework so that boards
> > which (will) describe an opp table also get the required power-domain a=
nd
> > regulator votes for that rate. The OPP table is optional, boards withou=
t
> > one simply fall back to a plain clk_set_rate() behavior, so existing DT=
s
> > keep working.
> >
>
> Can you please share any deficiencies you see, if a regular mechanism
> of 'assigned-clock-rates' is used in dt descriptions instead of setting
> a supported clock rate from the driver? Or is opps mechanism supposed to
> substitute it?

assigned-clock-rates describes an initial hardware clock configuration
applied before probe, but is a bit unclear about when we should really
use it. In our case the CCI core rate isn't a fixed hardware property,
it's a software policy tied to the I2C mode(s) the driver programs.
The driver is then component that knows which rate a given mode
needs, so it should own that decision.

Driving it from DT means the DT author has to know the per-mode rate
constraints (effectively reading the driver) and keep the two in sync
(the CCI/I2C bus rate and the CCI core rate), which is probably why
several dts files got it wrong today. Enforcing the rate in the driver
fixes all of those cases in one go.

OPP doesn't really substitute the  assigned-clock-rates, we just use
it to describe the constraints/votes (power-domain, regulator)
associated with each operating rate (picked at runtime), if any.

> For instance qcom,i2c-cci.yaml example uses 'assigned-clock-rates'
> properly, in many .dtsi files (NB, but not all, which means for a number
> of platforms CCI hw programming is done incorrectly today) CCI clock
> rate is set this way.

Yes and that's fragile. I think we should remove that from the example.

>
> It seems to be sufficient to get the clock rate in probe, compare it
> against the supported clock rate associated with a wanted mode, return
> -EOPNOTSUPP if there is no match.

Certainly valid, but I don't think it would hurt to complement it with
additional enforcement in the driver. I don't see why the CCI driver
should be prevented from configuring its own clock. It has all the
information required to determine the correct rate and should not have
to rely on or trust whatever clock state happens to be programmed
beforehand. Instead of merely rejecting an unexpected rate, it can
program the correct one itself, which is standard driver behavior and
not particularly different from what many other drivers do.

> To get a better idea of my proposal please check this simple commit:
>
> * https://github.com/torvalds/linux/compare/master...vzapolskiy:linux-lpc=
32xx:cci-speed-modes

Thanks, I think I have a clear understanding of what you're advocating
for. While it does expand the scope of the original series somewhat,
now we've discussed it in enough detail, I've taken your suggestions
into account for the upcoming v3. Let's continue the discussion on
that version.

Regards,
Loic


>
> > Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> > Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> --
> Best wishes,
> Vladimir
