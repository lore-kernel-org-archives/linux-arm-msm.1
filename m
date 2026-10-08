Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99AE38D018
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 12:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460948; cv=pass; b=ZNfC6V2OPxJSmcoNQ5rnbrma9RwW148eJEq8jnDyYtNv7vuRT75EBgQFiQvlXRJjt5LCt93UwGrfvXYftlPcxsr78flsQDy9WiUuR4NpBliwPf120YcB12IpNc6sM+bmzIzvcGDUVrM2Zvu9SFCBbtYVq9hU3+Y4dRxqOIplyeY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460948; c=relaxed/simple;
	bh=atg9JnBD4PDdiE+BfKr/NcQOT2zg/X/V3XZ+Lu6gJG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BQRb8ccKyWEPe8qBkkKSlYtlQeYnHvO/FIt1Jle3Oci39RfoBOQlXSObDoINRbUfUJWjJgj0VALA0/wHgEr9bCWIvu9VB/BJpIV2BHUvfZKPOmMv0ZbMdEmOTgZ2PlOz5My4Xt4SpggIr0ugO70GBdg0xwyisXfBYGtDqqq+9xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O990Y1K1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA55Idp3; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O990Y1K1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA55Idp3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKDTH1269584
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 12:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=; b=O990Y1K10A9ypcip
	befJvButvLu/PxGlGOk5dHc47/XogKGXY3bxmFxjc+31q15wG41SGE2Ws7wDmhkN
	mXpvKOf52DB5m7NvLpsyj+99fGZV0SKic//81IT2LlUXsKMYVffYsqpVp96WNJu4
	yDFQMDErV8TpYGB8k794nUG9GxR21ZQ8CsyJmy9yGSgfy3Kfie+mo+UezwYC/ZFf
	VAPOxHVIvKmP6tNEQZqSVf4nZFWDPXDWYoKYLSo3uFwHPlxDfZa5HOnuJGq6Jw9n
	5yBPkCJO9qK0wKqB0St9jtoW3qEMmZt5eukATFZlrgvMoFXG65HsMsZ35oveMGsU
	qjN+Pw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32pxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 12:02:25 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so8504367a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 05:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791460945; cv=none;
        d=google.com; s=arc-20260327;
        b=rYwV2p3pPlfP71apD4t2ijvsVtZIk8mqTJpIYUobTxJ/m/cnpUGSSjiaa89Xp2R8PI
         L75q/etycAXongD0406ra4WvHQ5Bj0OJysQBSQgrtQoUDm/eAjP+XlCVkNutLCAuP0mH
         wOBMb7K0hjh3E1zj4r9S6SnZvRI6lBPC1wVFJLCBULCCvo92d8mYhr0OENw/WoN40h7Q
         65sMI5C2IkHkZ5goAdFExNjRnLMkBuSWRjP49titatdQdP+cCzbrSLpqbYl7x5JOm9P/
         AmWcQ/W5IE/cKuV4y7h0z7proLJYIevmbNDiyr0wqjIEA4M3O1NY5LdwuJKjMlSaOV3h
         bqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        fh=VmxXVLg1RKQw826+aeKb2Mro96pkIbRShXAozELqMb8=;
        b=jvHXsp9oT/Ameh+23KP57s5c5dwMtDQJF0qrZ0o9lY6bkVh05UgXYv7ieWjcTSvhe4
         W51ZVsF8vWj8oVkLq4qpUvRf4LbZjPIGfT+p1xQVgcFIa9T/WwnqqO6NKmRjXKRkH24A
         +5BG+v5iRtiPev+kiAwm0PdyqPVweRbwmqWQtOevsCx8bSeeAwBC9LAvxrmElJLZZgvp
         k2xuAJAXBBwMc50zzttHiZLQXIuPuz0MZrNS8gvw0RlNnozvkANJm7/1jHBjf2w+knqA
         oq8E8aRRY91hP0wEogZlE7+URMpDRecAWrKTo3l1eYU6Od5qu6jlLar/N4THPYHhoOqA
         vlJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460945; x=1792065745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        b=PA55Idp3cvLsMZnXALQy9gr1mXCTx9nSZ/G2225WR9SCdZixxBRjMmfX9AZ5f+/zfQ
         X3La5adl+uftUdTLqR0eef8mvp2dzEEvMj9f2rgP3RFM4YU4Q9Cu2CDgl0AbB5xlyr6r
         pyf27vO81nG2JuJHY+FwsBD9yyvLA17h/TTOui9mJxBPzTF87HtqUvQiFSeB7jIWoJsG
         7hJyq4vzP29FvhKZ42Mu1IVwiCBrZt2hn3CBDs/VEE4cu2wqWc+OgZURvzyEPJIw4P+d
         TbVXT1M+u/ppH5HU3dYnIcTEFbTimW0zc8aUu8ffiz/a6v71jdLsiglziupRJVH7QGYz
         KErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460945; x=1792065745;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WGi09SrTo0U6zS6jMEBNe7z2iwGbTs9TZsNM8Cy2ZNI=;
        b=fxMQWLzS6BmiwKwaa7GyUMr90cs5GVS6wk7R3/xCz4D0E4R5tQcVnzEIWCMBRqKCt3
         X2UXhwm+dPjjciAVogJkh2jGcTo7EeN3DbVeLxhgpoUpxhEBrTEslJuhiftsjhjx0LgX
         tZDbfhBZWPyV03JIyKVtNtFIBbo9RamcL7OlhdJECEGDrwN02ZZ4rOBIcnXyhJSo66HG
         V5AXx6ZWa71ZND1GQqgW2wz4vBjxRZp9bA+HrHAmvGFcmMgwQePfiOBJPF4HDzAZYrH/
         6RKxOcMAofOfCBWFGf/gp/JH9CkDThofMvFqTmZTQfNp1/l0horZxgrcIF5iDCFuK6SX
         zMaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzleN0E5Q3ChYM74Smp2suWrXXiiyYS0u3frQUYNFC3cHwWUUNdc7d4o6JsnBQKTVP7MwmQx9mgPsypGRaH@vger.kernel.org
X-Gm-Message-State: AFq9FYK7UzFiuQlLgkqmgO2JY9h6XqoqGzRJ6lW9MGKQEPkTsNj19kYI
	oUtrfgl8AgxYiysoC9S8ZvkwMyjw9o7SUaDSR4qmCUlA08dhmAOiM1W+UDylgP43kcwRYKJ29rN
	yfQ5uXd5AaSokyGbjeDTRTu+PII1kB2glud6A28cTACj00/vKt+dtPYOJy5iZbN4UT/RBqDCfcv
	5KV/NIzHMOcwiIHKxIB2yGKJDoX7ql39FjOr+94gkxStg=
X-Gm-Gg: AYBFou1xR8/pxrcCFs4Dc2/uvX5fYFnFs6Uw5ni2M0DjxV+FnA6Blh8crIiNYIchk3k
	nm4CaTyQeQmK+jUfV/S6NgFWRmARyfmLAVYjRdUCCCj3u90i8OTorYArm+Ml5/pCCRbLwk7D/8+
	ZGGa564mlUn33XMpQvg6lqG2n2kvqOGN1kXcxsdTfrMFI2K/tK1Ux1GZHylw==
X-Received: by 2002:a17:90b:2b44:b0:3a8:6a6b:596d with SMTP id 98e67ed59e1d1-3a8a1975785mr5197715a91.26.1791460945026;
        Thu, 08 Oct 2026 05:02:25 -0700 (PDT)
X-Received: by 2002:a17:90b:2b44:b0:3a8:6a6b:596d with SMTP id
 98e67ed59e1d1-3a8a1975785mr5197664a91.26.1791460944545; Thu, 08 Oct 2026
 05:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
 <20260926-vpu_iommu_iova_handling-v5-1-0322ca5dc10c@oss.qualcomm.com>
 <CAFkd8hujKYhXveemgPCbsUk5DFB=fQSxqK_-69fP5aPzoWSzbQ@mail.gmail.com> <f07e4b33-47fc-45a0-8fff-105766efb5e4@oss.qualcomm.com>
In-Reply-To: <f07e4b33-47fc-45a0-8fff-105766efb5e4@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 20:02:13 +0800
X-Gm-Features: AclHuK-05PCYVHzXB_f-P8kAOP2HIrxiCmDuqzqFR01bYQMC_H8MtqHJBkaqdg0
Message-ID: <CAFkd8huiKtJqEb1jMzCe6ZaQzatDCogFsQkhFBHAdyvDdbM=2g@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: media: qcom,venus: Add context bank
 subnodes to common schema
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX9X92Hu52D4pl
 yxxztzoOPQNntHNoOx3+o0WCG50hy0nywFAuQj/GKcSQzBCdfKk7RYGtiGDLzZ3VZuaU91m1fo6
 ItQtI86x6UcgC2BOvdOAdWygSH640K5ZJvWS2t1bvyL/Gh1KJwnQUk71/wOlYnelO4bqZh/HTGc
 AyR2qlsCYy9urj03DuQOFFQJ86Q1AbgGC/3DocNIRNcLOMk35UBeVLaABMBsTlAM2s86+u6obJQ
 ib2475exJkEpf0dfzQvrkSk6E0SopuzR7aLK6bZZVIJoTwvSU7StlRLLIvG97azFeqmDkMmV+Dv
 M3ddkpEmxEMh/Ak4DSX+xGWfVkA9tjoyoM4Xs4kL5aiPohplH9SR6dqbSwDiYtDqL35DBz/yjaV
 tc0b9uT52g1NwXIj8ikvxW/a/iNN7C3Dzf7F7nxtwo/GkXuk481TpDpcXWRl4qjCy+8Nz0yi0/u
 eQgKhMAl4sB97PK3YYg==
X-Proofpoint-ORIG-GUID: 5gdzTk2ZgA9pbq5HgCF1dS7xoF_p0Ckz
X-Proofpoint-GUID: 5gdzTk2ZgA9pbq5HgCF1dS7xoF_p0Ckz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX1pSTeYR8ypyW
 ugGSr+kAO5Jn3PuWep/twN5tPSTwW5/WICMsKzWQbQp2F9DV6D2FzQvAIMn0Z2+umwBL9bNnJt6
 OxsZ4MV3bw3iBzXg5G8iflHe/a7WZvo=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac78651 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YSXHpTArrQjiSFk0xCwA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047

On Thu, Oct 8, 2026 at 5:34=E2=80=AFPM Vikash Garodia
<vikash.garodia@oss.qualcomm.com> wrote:
>
>
> On 10/8/2026 12:16 PM, Zhangfei Gao wrote:
> > On Sat, Sep 26, 2026 at 2:38=E2=80=AFPM Vikash Garodia
> > <vikash.garodia@oss.qualcomm.com> wrote:
> >>
> >> The VPU issues DMA through several SMMU streams, and the hardware does
> >> not give every stream the same addressable range. The non-pixel stream
> >> cannot address the low 600MB of IOVA space, while the pixel stream can
> >> address the full range:
> >>      +-----------------------------------------------------------+
> >>      | non-pixel stream addressable range (600 MB - 3.5 GB)      |
> >>      | 0x25800000 - 0xe0000000                                   |
> >>      +-----------------------------------------------------------+
> >>      | pixel stream addressable range (0 - 3.5 GB)               |
> >>      | 0x00000000 - 0xe0000000                                   |
> >>      +-----------------------------------------------------------+
> >> A single "iommus" property on the video-codec node puts every stream i=
n
> >> one IOMMU domain sharing one IOVA allocator, so nothing restricts a
> >> non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
> >> that boundary the hardware faults, which shows up as unhandled SMMU pa=
ge
> >> faults and spontaneous reboots:
> >> https://gitlab.freedesktop.org/drm/msm/-/work_items/100
> >>
> >> Given that the address range restriction is for specific VPU stream, i=
t
> >> should be ideally be moved to that stream. To achieve the same, a subs=
et
> >> of streams is now represented as subnodes, so that each can be
> >> associated with its respective addressable range. The design was
> >> discussed and agreed by mainatiners here
> >> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kerne=
l.org
> >>
> >> In the past, this limitation was addressed with an iommu-map approach,
> >> with the iris driver dynamically creating the devices. That approach w=
as
> >> later concluded to be a hack to avoid having subnodes, and was NAKed b=
y
> >> the iommu maintainers. It was discussed in detail here:
> >> https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kerne=
l.org/
> >>
> >> "iommu-ranges" on the subnode describes the *allowed* IOVA range that
> >> stream is allowed to use, so the IOVA is allocated from the specified
> >> range only. Define all the possible subnodes so as to describe all the
> >> VPU hardware iommu interfaces, both secure as well as non secure.
> >>
> >> address-cells, size-cells and dma-ranges declares the 1:1 DMA
> >> translation into the parent.
> >>
> >> The parent "iommus" is kept as an alternative via "oneOf", so platform=
s
> >> that have not been converted to subnodes still validate. New platforms
> >> should use the subnode form.
> >>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com=
>
> >> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> >> ---
> >>   .../bindings/media/qcom,sc7180-venus.yaml          | 15 ----
> >>   .../bindings/media/qcom,venus-common.yaml          | 97 ++++++++++++=
++++++++++
> >>   2 files changed, 97 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7180-venus=
.yaml b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> index b21bed314848480b82153e49602f0b19e08e7335..bfd8b1ad473128c974bce8=
4639cb0aff59d8c2cc 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml
> >> @@ -91,21 +91,6 @@ properties:
> >>       deprecated: true
> >>       additionalProperties: false
> >>
> >> -  video-firmware:
> >> -    type: object
> >> -    additionalProperties: false
> >> -
> >> -    description: |
> >> -      Firmware subnode is needed when the platform does not
> >> -      have TrustZone.
> >> -
> >> -    properties:
> >> -      iommus:
> >> -        maxItems: 1
> >> -
> >> -    required:
> >> -      - iommus
> >> -
> >>   required:
> >>     - compatible
> >>     - power-domain-names
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common=
.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> index 59a3fde846d2196ab1e4588eb396012ba6860712..68d5e592a028c5eecde04c=
e72cd5ae6815ba5c82 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
> >> @@ -47,6 +47,93 @@ properties:
> >>       minItems: 1
> >>       maxItems: 4
> >>
> >> +  '#address-cells':
> >> +    const: 1
> >> +
> >> +  '#size-cells':
> >> +    const: 1
> >> +
> >> +  dma-ranges:
> >> +    maxItems: 1
> >> +
> >> +  non-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU non-pixel buffers, including compressed an=
d internal buffers.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +      iommu-ranges:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +      - iommu-ranges
> >> +
> >> +  pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU pixel buffers containing uncompressed vide=
o data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  video-firmware:
> >> +    type: object
> >> +    description:
> >> +      Context bank for the VPU firmware processing domain.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  secure-non-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure non-pixel buffers.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +      iommu-ranges:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +      - iommu-ranges
> >> +
> >> +  secure-pixel:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure pixel buffers containing uncompress=
ed video data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >> +  secure-bitstream:
> >> +    type: object
> >> +    description:
> >> +      Context bank for VPU secure bitstream buffers containing compre=
ssed video data.
> >> +    additionalProperties: false
> >> +
> >> +    properties:
> >> +      iommus:
> >> +        maxItems: 1
> >> +    required:
> >> +      - iommus
> >> +
> >>   required:
> >>     - reg
> >>     - clocks
> >> @@ -55,4 +142,14 @@ required:
> >>     - memory-region
> >>     - power-domains
> >>
> >> +oneOf:
> >> +  - required:
> >> +      - iommus
> >> +  - required:
> >> +      - '#address-cells'
> >> +      - '#size-cells'
> >> +      - dma-ranges
> >> +      - non-pixel
> >> +      - pixel
> >> +
> >>   additionalProperties: true
> >>
> > Got this warning:
> > arch/arm64/boot/dts/qcom/nord-rrd.dtb: non-pixel: iommu-ranges:
> > b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object', 'integer',
> > 'array', 'boolean', 'null'
> > arch/arm64/boot/dts/qcom/nord-ride-embedded.dtb: non-pixel:
> > iommu-ranges: b'%\x80\x00\x00\xda`\x00\x00' is not of type 'object',
> > 'integer', 'array', 'boolean', 'null'
> >
>
> You have not picked the latest dt schema. Please go through the cover
> letter where a PR is mentioned, please pull that or validate against
> latest schema.

Yes, with the latest dt schema, the check passes, thanks.
