Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB623DA7C4
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790856883; cv=pass; b=UFdVA3WoDc7WVca2NugB1q196Hs/5aTsBAwSRnlZcsUEIon2Ivt4dm/esl7WekgtQtR+U2Z5TcjatbdFpH8kHAy5SWwc7pfpZ1HcXDWvOV7yLCXkk5wtP8NxnX6V0tDszdJG9wv/c86Ob1xaWO0ADiuW/DQIrgDqvXpj13LUmqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790856883; c=relaxed/simple;
	bh=GQ+mO9FqZTwGcpM6upiyjFp46GJQt7lNaQI6Ua8Mn+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lkYN1xli8uXunOjL+dBglXkPlR/n2BpTgHD0CHsGhgWuhGFQqIPJp7AS7PZSDy/TLWac9vzbqtNPGSA9aCAQIc6BjON3tkmtVL+jSXMChnMfm7nqb9NdMl3XYaZo3daZT2AvTEFgI54nnGVjACi0i5av3zeYpxrRYd0LxXndzf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ix+QKi5q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCtO4muj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ix+QKi5q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCtO4muj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xLBA1932317
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 12:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=; b=Ix+QKi5qPV1KtdYU
	Fd25b3ki3mnYwBCEfyyo8hdnic98d5QIh6iuvE6YaWGQ5wyjxfrRUAtvFXTy19dR
	rciV7KX7QI24gLaKN1mcP2EKic2w47fzakCeYc7x9r0OAjhiu0zuewMAp7rCOJfm
	PK2uj6B38BTmvItLU4ryTowSYZxZ0iaaMokEpxDNVywufMAGE0aXRWrUIBx0j3lU
	J9fs4CYlvJYIlrwm0y9UTz5vf0uvZPnMnYQxXS2pdmx2tFzw9WfuKT6wK+c5e+7O
	azYNBplUrf1peMWraTpwUdfDTrMB2j0fkv2CM4MsUiAdPa6hXZ6gU2IlgUXy0bMJ
	etfVfQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5avdw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 12:14:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e82060977so92603585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790856878; cv=none;
        d=google.com; s=arc-20260327;
        b=Ear2FpdT8a/ks0BxVkrWlLvcKr+f9CHC47RZqbkd4W1oZQMHugvTcaXYbsxFP6Fazb
         /bckLP7FCEJ5ZtD0eA+Rg0mplsWHE3QF9+RTjKeLXmdAmqS+ixRuwkpJ/bL6tFfyT3yd
         J7FpQkx81WZ2PjGTguANxlQg0BqcsiE1PAYIOtkTR0knrrCDPXCE/jTv31rYG5ahQNLO
         p6jPCeNmyukVtUeZvv07vM7LHi+UEylUGfslpUwIo6N/5LH5K2cDEj8gghnzdxTX232N
         YnQ7TY6v4H73vWEAG1QyzLToN9Pw6vVJVIGy3i2bbeDZUry2yf5tGaVKeovcyQGZC1Yh
         iUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        fh=jQ7j0y34h6JLdlCdEZtcYqP+L96iB7hRayIxl7SNhr4=;
        b=fiCYZcFGFz7/hjrFliH25Eg3+R//boXZkGy34iVV/LNDnH3kFtly8IraGyvvaa67Pi
         C3dCR1HIBL6PWj6WfuFreehduSQE3zeftZINTPgUkYMGgs+P18pBu5vZFAwfZh3ZF2Lv
         XXpTRXQW06a6HuHA57wh2W1iAxQUFtIbDVPE5xd5vzsX3ixSHvWIp3goRHbNMjzAbq91
         4NADMX3qdP2BfFLm96qAKjMvtHAvJd80AE/qJ1PPTLoxmCZDPRlvIGDHYLPOcjnRXx6K
         6l6FeMOZeuOESB5zFtR7aST9Jf4HXSP540NoHA105/mebUwR8f11IPKVdFqhi8YnnZNm
         /hjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790856878; x=1791461678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=dCtO4mujndbEcqcughlEHpHAB9ClpP71TWr5+XYy5XAR4HoQpiTgeBIgmzyY33GS2w
         pPh4EM3v1HhBjVFA+GJmuQEnOZqUw5flMFk2KNPHnEoRwCd82Cqnw5pnDW21v8OhPulD
         sK5DIT8uXzlkz6VPhBXTe7YKRjV1n86wuf7kR2Vb9ZYvN24mS+9LrhAlypV0UYLBatTt
         aJ6nQfjWUz35KBm2urdIMUhr8T7JcTLF5/mm8VW1LXYxRS8oifyfkcaHGSUpafI49ZDO
         PUkekzThVDjJYeCWUSye1lpkmMB4ghi3f8kIhaVl0DSPhYpZXAuISMQaXTNrULXoTpB3
         H7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790856878; x=1791461678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V8uPC0AzCmkid0pU7KtPQteVbme3oQvQ9onokkXOY=;
        b=Iawj8Tb6ifpW9/yhjn4BbF6ZLEcXV05qlrM/HHdAQs5naMIld+kio319atMzjfOJhP
         N5hLEqt/RhXZ5Ssl7oKo34qXefqNi46PzD5feficH9Z6dboJqLTXtuw4cVPqvJMVvD5q
         KChBSHHWC2S8DvUH7w7g/iJ3Z7nFzitJPwP0FmPSxBB/gCEfkINeRsssrI+hKKX9zaF8
         BKAgaRq0rxDaSt3CTqOPBPODa+WlSnoG9r3cew8knx2PYGmwA9audHYGvUpE2DNvIFmg
         1ZxE7Ea0u6Lg8Tsl385Qc/jMHj3PJQyftMLjdQUTQ7h/V97y5y9s0OpZXOMYn1PWEkvL
         /RPQ==
X-Forwarded-Encrypted: i=1; AKwUvByBDT3obblMGqxT8g2uI4v+7286T3AkuggAQU9WJtVBFB1Z4XSklEV0BgIo9fX4Q2TTFxyQmgg6Ah3b0KFU@vger.kernel.org
X-Gm-Message-State: AFuF++mSuRglJzJH/NulzsQz+rWtegc5q3FOA5e8BdqUIb4l9DpLFe6J
	gJ3VMx3Od0VLs5y4+A8mJuo7WInjO+a46R+nfbZuN2BuDvGwfVHX3w41yKxWZXnCtCYhH8hOuwF
	dUxtqjdYZ8oFVOuGmbNtNU8PYPjaA/++xePRmQMMPH9dEH+9RG69WaR4NUkfmvtKO8oJOQYhIms
	slvZcvgFIbr9sy7EgGDl/a+9KjNzrWhg159No6tYH1RL4=
X-Gm-Gg: AYBFou1pLPnJqNywWOydpmun66rpIeWhzP7uAsv79tRbe/BZ649wmYvTq8/SLnLZiv1
	JQJOsKfwEKxVQJQWbnmgqXVp011SiGb0hfdgorVS+77CLU1yE0n/Yuk8V+yZdX1I49+lxnOCoh3
	R2cT1dhUaMi4DiAAcTtnO+8WXuV/gqzPTyGjwM//93BOPSVVyl7/TKCikePMqp1kx4Ev/ZhHGy1
	LTRGDe/TWzYe31xvas0XeSm8Ot9cQPfWmRZMWYYhY3YkTTjXTknfs+Y6MudrtudP5iOSjXY6JZS
	K5Ec7Gu+dYTM5akhKZAt5UgjDa+X
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id af79cd13be357-93cbb1bbbaamr275242585a.12.1790856878492;
        Thu, 01 Oct 2026 05:14:38 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:bb1b:b6b7 with SMTP id
 af79cd13be357-93cbb1bbbaamr275234585a.12.1790856877804; Thu, 01 Oct 2026
 05:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-hawi-maili-camss-v1-0-cbbb42e534ef@oss.qualcomm.com> <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-maili-camss-v1-1-cbbb42e534ef@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 14:14:26 +0200
X-Gm-Features: AclHuK_XuSX4ZePWnnpee2tgGkBBnS3UvugT_wZeMdgt7PGi5qaYm1CjHnboJlg
Message-ID: <CAFEp6-1Zvt0hhBd7LNx2hsyi9J+bxCT8EWN3jZ4B30SO58SCow@mail.gmail.com>
Subject: Re: [PATCH RFC 01/15] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: BtH4oSN3teJDguE5Xj2FTSCN6XVP-66j
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfXz0chRD3TBxBs
 QCpADIQfwSX8lAP2ZHCqO8SzQTe0zEMxUvykTHgFffuuVxqFh8jSsp/N2RY6fgZ/GeeJNlPJDfA
 2niGsj+qQI1kuz2lbDHEqJyHGw+Aiwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0OCBTYWx0ZWRfX3wFhI6OxFN8d
 OWuBebVW8egcDeGuXBaTikdlBzl7noPohuywFQDGngcN+zq6DZgLILLMJYbK2RCAqj6iAsL7BDX
 tZa6P1lVJB331P6jwr1UqAA1URvKf7vYhs2I76vcsvpqLnywzb9I85XaFdADJM1gSlzc9/mPHba
 wWk4JOxT6MM4+ZXLkxV08/qjGCy1Kxz+5jEEwLBM8iCX+Z9ejKDP09vm7qVGWHvUVw/NkBE9AsQ
 gqnrS3TP3KDMLUr2TM2EeDCpS95E5VbVpYMjDaxlvM4cQ3M/E6a1tJXlf5l+sfum/zn8DffP3+U
 qS94AY/3xUFzP2GB+yS9wOJH9AcNbDB8oyiLzMv7ycnnOCsHhMn1548AAFozDEGCuA8vjZ0KQtp
 mxB/AQMP3AGlOJBzGEa+AcihSag6q84h4f3Dzz1lEmvzRAeNf8vCaB1ZNnPhA5MkM5pNTKYLBQe
 jZ9teQOgvJAtV6DtEmg==
X-Authority-Analysis: v=2.4 cv=NuxE4MdJ c=1 sm=1 tr=0 ts=6abe4eaf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=R4gLiKe44IeHqeJXRIIA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BtH4oSN3teJDguE5Xj2FTSCN6XVP-66j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010048

On Wed, Sep 23, 2026 at 1:02=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>

I think we should stop falling back to msm8996. These are newer IP
revisions with additional features and resources, such as different
FIFO and queue sizes. I also plan to submit packed-write support soon,
which will rely on those capabilities. It would be better to add a
dedicated variant entry rather than reuse the msm8996 definition.

Regards,
Loic
