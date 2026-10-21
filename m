Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569409;
	b=fw3OV1Uxdv8ClONAXA8KLOlMeLQ/TYkYRSJiwOCBtNKiqywBhuWTVB+9F1ZfkyKzR6VA
	 EVUfGmjrWLzSncEeWb8cPXXQrjR83wsX2nnNreC9yIxxQR/bQx/cqicObg9rSeJjdeN7i
	 WnkUYhIMbKgOEOQR6fxt5ggsd6DYytwOqouCOPNZXeEXV23QDwNLNoIUD6gVRiD3fVa9G
	 sJIMk2KaC4QOR/3ohgLVKRrhfneBfX6zOCl31plvuMHmqAeQuXoY4fBnQz0kWgH34079/
	 LVHOMCNry4uIJnXUcpe5Cy7q2KB8/k9uM6Ay5sxKYRZTvgdhCp8E0Z/XrxJoP9f+gxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
	b=KwzfDUk5a+bVZ5U6H1chggO5h9DshFeQ0FIlFUNzSyK31AL2/R/Bcf1nOceoSDyZNp81
	 0niRM7FoUtyssGB2F+BlWoklnuMoaD0vCbMtco6xzkOHSTmR267vHEosgHKcoTvUuP6JZ
	 Y0/ojkMea3IKRWJRqAAjAps5vrZvMqZYNNjDzb1W9XZhjPFzZT2unRTzqbuaGT3GedaUk
	 IFJBROduoSg+27k28rYUy1zarokXkPuq48a70f3XBvtyLkFyXh732dtUmx7AE8tq0ubeX
	 hOqrnk7dZq4180gsO3qIzi3iPks6MokatgvmD3SJl5Ka5r+59Gd8HeVEePomUi2zuHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECMfjh2K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B73606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22B73606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECMfjh2K
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j1D43355728
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=; b=ecVcew5dxNN4k/2h
	0RYmgVIYj9XR9ah50jv/VbBldcVVw6zbs/CXd/yG3XcGS6W4b7bB+jU3hw2n3Qv6
	3TQtOw6bJ1aZpflwraMX5ssKqb7s0LDOGyA8OQngx4RF7BV1ajmbnlumILuWKT6J
	FfGE6X98vL3noPVId+y+Pm7ODYSl23baYC8sChE8YDbh0PV1fNqQLzIJKCCVg9+e
	mF1thX/NT34kBc0UHCo1vl4lRu2NfZrBMikrimQIlhu5S+IKzJy7hWyLmvO+c+Q6
	f2L+EPdPRsESNwVnfwO3Gkl+4zqUJxj/Xa3QvIZFI3M2G/Z6QQTQxSH7y1OITNda
	MQVFDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0jnw6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so56318785a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 00:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569406; cv=none;
        d=google.com; s=arc-20260327;
        b=sKdqxgz5hJTPFyXcmbXC+ORABAmAGx5rEgQVlPh8wTpvdi+mqOd8P6Ob81W5lOFQuQ
         X6ainNS+p/dVLJlzFPu1zH1xjicrbbL+vguDVbsEf8MsdviYIy3baeP+Tz4dh84aHXDI
         Ec7BEQK5g0E1a77yHA/P5rAEezo35fP5sjjuQpTI+oDaw6czvb55QrZcnhlGdCGqTDt2
         Z3WCkVMx6qX+LLNVbN9CaxIR+Ik/5EpojoZYC90uxcSZKaYSoxvU1WXhXwavQ7eCbvXs
         7A/Pfb6wreXyiqwE/MmQGzjOPCmmZ8q/ZyoaWPsVJd9keAKxtKnO95pdSQJw2myzOgEG
         OShw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        fh=sseC0Ujlfli/Pspn40strFi/pE/OhDOUnrD09K9DPqI=;
        b=ZbErYChXC8NDQmfFSi5CLxw4xcmKFqCDxYq+3bxnRP7jpYUl098lWdU+zxnfEssMCl
         +1/Jv+TQXeUVtOU1Dhf4ExQPovE9nVOc1LWTrUm49xW5p24wymaAn4VUHOSONmtcT8Fp
         tkqkkyLaecyqOb2pJ7SlOXVMWB0RfgVyFKxenGWlpPgqlIATEpg3JCRAkuZg0FgyndF1
         E6J2T82qpTcCzjBQN78QcwQyP+wHFN1axB4Xy9JVmFqsrw5QREPpLBKPzmQnnnVltDpO
         BEym2GqiOfGXSQJI4yn/8uMFkUR7+srJeBcg5R7BDv3aoyEGVOyZw1IDRB7RSu59bnEF
         npew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569406; x=1793174206; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=ECMfjh2KWQ0vOsQePNOAlx8/m7y9l8nYEQKdXOisBYnUujJXJnn5tyPOC1NXmZPv1e
         fAYY24Q/VG5dF/5O9xFoRe8K8KMydWelCI6C4+3bMvs3txN053IA+v0djTlkYINgp/qU
         csjSct71i8nOYHSGGhc/EF59YfP68swnEhKpHpqWiZmXzhod7z9pHRHrXGM9Sug1j0hW
         UrH2qCok8Bw0Wd/jpmea/EUGed5itU2VA0/dgEND+jxvwy3RJ5lb84hU5OfMOfkfY41G
         XyJm1A6PP9AI1lgMItDrWpplKqB2h5MhoOmRhDvfQUv99Tz/Yghrz7ijVdJVEZBZn9Q1
         BHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569406; x=1793174206;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=ySLDAv9k75t8BeZfOhVNZhRcgXAdgtF2fcngLazf8hVLPrsD+2xYeasHK7cNd9e5e6
         94uDSG6Jyc0ZEdDxnA17eLdQkR5re0I7zF6/X/2auxHD7Cns89zEoCkU1B3oCzNiP6fs
         SA3nEiDQvQ1PetrXNQQ+dJD7UCYFno4rtPLAfRyO7A8aq42Y/vp+Auk3gNh8jJMzT0Gz
         lug3KQYIjftxEibmGPvAZiEXYV837K54cihNUiPcWF/fHVSfqQU6jk5T1J+nUcLqEK7p
         W/c8a4cGZAxRKV+m5i/NkOe/qjE0VbtHqGcuPwysgw8pZBXVQ8MqzAnR7B0FHDqe75rG
         FWNg==
X-Forwarded-Encrypted: i=1; AKwUvByfVPZWqK1c2kzjesFCohp7wOwr/cduHyAFJ0WP6TsQRl/GLgg5NAKpDz2b5KMFqHG15yJoGfgJwwPyRhhs@vger.kernel.org
X-Gm-Message-State: AFq9FYLI+UeJvW1vEFt0HHalzyxjKuvxovj+aszogjadS2LtUpvnvima
	/W3LvGRX0vj0g5ffgOfvBRSEt9NBB0UoYsieWKOcyjzMquB7u/fyz7rw8npdOmiYjQmsQ+tAUEZ
	8vnPKqnRscSKaVgypgorBeXMCYbrWeSgK0+OpiLUUfaH8hKoUe6RyaiSbNyGwE/8Lh1ca0V0U5A
	AFqen/6/ldW63KfvVRrAa09/rNmz2TWWhrSzR5IjdyaX0=
X-Gm-Gg: AYBFou0+ZZAWhG9SWB6XGZvIGBPZDauH5UU3FsZKePcEE+lmib66RpD2K5P5SRuqodZ
	EvHmX0G24hAmvEyCc24PWjRm+EBKn6HIt6q+qSZ8Rex5wrtAmleZucTomUPGtlsd6n3/IB5HIpr
	NoZ0Tblrw1zNWtIvq8M7fjjPbSUSoKg6gp14KIyMPtRlW6VQIVb+hArQbQ8RlR3ALk48pEsBs1C
	P+4PaOXSYMxzo9AjUU6UqSru/PjJRkmxGmftejNm81mkWCkAYxfk+J3NrCf2baND5RZjw+5eCc=
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93f57ebccf4mr265204485a.10.1792569406285;
        Wed, 21 Oct 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id
 af79cd13be357-93f57ebccf4mr265200885a.10.1792569405691; Wed, 21 Oct 2026
 00:56:45 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com> <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:56:32 +0200
X-Gm-Features: AclHuK98k2MczxGrkHeLuzC-J1vF9mCnI0valuaGqqaz9pJgB0ntPucnOeSha1c
Message-ID: <CAFEp6-2d_hpbJnxR4uAzWhkk+h2d6ffkbBWyATKGrJi2E_z7KA@mail.gmail.com>
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfXxIuCjQX7vQIb
 bhk5/gMwlJ4xoBmIoxwjA4YCj/Tjz4LGM2LEuJa2wnb3MTkrGTqNkZg8WeOwRU+V3VjfcCti0TK
 iPVKd9Dw6RS7TB5CsfiB0ra9cxRlzv4gXzJt9MB5PXt6doTt1osCaZsayt0eMMtcK5ahan8NP3s
 cb3pZG0s/8KN/7YKjWQtzrSjIRNx7PyzmC8Fzv0Fu6Xv2IYtja7DMFkbigKd1D8pNJz77gB5XWv
 AgKokn/DEJ9mFsVGmBlq921tzIY6lTy/H3y94JK+WhsExJEoTHVnra8WrJTdO6ZYyLHRM7Xwwkl
 BslrhtFQuopVdxWudPP6q55EHGiTM8Xv8gLhhGwSEyLw6k1fVWtIoZydnT+SgR1O4u1t/IvEnBG
 MmE4f73dO92uzCiCblSB8hQbvNHy9IGW8HoLYgX8wvnkWCUy3IXPUddaIJTVg7NxFaCgs+sZcsQ
 GajrD2SP8EGqRnm+SQg==
X-Proofpoint-ORIG-GUID: Ory4xRmcc_J_bQqKUBn6i10J65lNOikM
X-Proofpoint-GUID: Ory4xRmcc_J_bQqKUBn6i10J65lNOikM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX0UrCMHVQwdav
 tSLbz0jnzQSCglY8SLzIIVNjBL4zmcRpPVbhcd2dJQR0I36dIWYWHGN4pnnWBJkmY6QglJGzz1y
 oJtqWz5nTxZ+voh/7OcAC4MpGnOO1D8=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad8703f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=0Hab3u7fAHnAQfOSGZgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210031

On Mon, Oct 12, 2026 at 8:45=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On stream-on, CAMSS starts the subdevices upstream from the video node
> through their sink pads, so the VFE is started before the CSID.
>
> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> rather than the VFE. However, vfe_enable_output_v2() still issues a
> REG_UPDATE after queueing each initial buffer, before the CSID has
> configured the stream. The VFE then never signals BUF_DONE. Therefore,
> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
> and CSID Gen3 instead. The operation happens after the RX configuration
> and before the RDI path is enabled.
>
> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
> the VFE sink pad implements the reg_update callback. Platforms whose
> CSID does not provide this callback, as well as lines fed by ISPIF,
> keep the existing VFE-side REG_UPDATE.

So why not simply make reg_update optional and either not implement it
or nullify it for the related VFEs? That seems much cleaner to me.
If the VFE implements the callback, we invoke it. If it doesn't, we
simply skip it.


>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c      | 37 ++++++++++++++++=
+++++-
>  3 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..556cdfef6207 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..830c9c818d3d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..16a0b5663fe2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>  }
>
> +/*
> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding thi=
s line
> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
> + *
> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so t=
he
> + * upstream entity of the sink pad is either a CSID (possibly with RUP) =
or an
> + * ISPIF (no RUP). Only enabled links are considered.
> + */
> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe =3D to_vfe(line);
> +       struct camss *camss =3D vfe->camss;
> +       struct media_pad *remote;
> +       unsigned int i;
> +
> +       remote =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SIN=
K]);
> +       if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> +               return false;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++) {
> +               struct csid_device *csid =3D &camss->csid[i];
> +
> +               if (&csid->subdev.entity !=3D remote->entity)
> +                       continue;
> +
> +               return !!csid->res->hw_ops->reg_update;
> +       }
> +
> +       return false;
> +}
> +
>  int vfe_enable_output_v2(struct vfe_line *line)
>  {
>         struct vfe_device *vfe =3D to_vfe(line);
> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> +       bool rup_in_csid;
>
>         sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
>         if (sensor_pad) {
> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       rup_in_csid =3D vfe_upstream_csid_has_reg_update(line);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                 output->gen2.active_num++;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[i]->addr[0], line);
> -               ops->reg_update(vfe, line->id);
> +               if (!rup_in_csid)
> +                       ops->reg_update(vfe, line->id);
>         }
>
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> --
> 2.34.1
>
