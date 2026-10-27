Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118840;
	b=z2k6XiGl7CPjTiUVvdDaEqEt1Ol6QvmYwc0P4XIpVPBwhHfXCfF44ohnu4CKFF+19yot
	 sDSvyKIGUDZ7RHblYpcSmk19QUy1rgJ0OyiMHNHScDHsjxAtCbo9FZyDQX+W6bh10rgzk
	 yQPM16LBoV99ggmiA1n6huyJfBMHrKZ92MSHhUyMdIQ1nnIhn3K1t+HkckSSedHyfloWk
	 QzSKMRsqQ4TseF299rfzu3ljrKN0tCX/2euNO3Ef7Zs+jp4t/sewjMgESCPEfXN+aGSST
	 s/nDN1dzQB8o+Whli0Jse67HsYKSdUr8jj5pJvSadHAokzPnKh7d2XPtFi7h0mJD4Mw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
	b=RfY5LZkU2vnLICt+qVqrhwzUJ9yfTAmywKUlL4rxifBzo9Vd9RvEGWy+rm7aa5jnxgmM
	 2n0+TdE/kqCId4/HfxL7LH3V0fgP83pTFlZMRKqL31aV30d3KdFrZdIrosMlacggsNSz5
	 zqeuyGO36Oo5wFncS/tPU92L/BHaBfWqPtaYy356VrxHmtS49l3iy8iVTpoLfMnvw+M2p
	 SWw+zkkLFbhdYzMmLNR49QCqM6NYQnxxy3e4Y16y6hKaCE0Si5HbGThW2cr8Kr21SyHuw
	 c11yufTCnLeymUt4HdyX+RvjE+J4N376sDR84JKcCvbSm3MXHIUkJ4GEGtDZfW+q0DA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EAC606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22EAC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GDsh1nvR
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvSd2548921
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=; b=U6pJPW1a9PcPo0tq
	HaV0IZjrwONB2IQ8bzDs7E6/FnePQJ2g1yuYzIeylDAxd2zPmi3gAfb5mVOJCC/S
	kH9fipkT6AiMxzac2Ft6xTvMY1VPJ/q8ugfBq3A9HctgWvpfrCPORejVHcEz2zil
	JkcFK+z6ylbkuRUlYc+o0moz4R9bwUwXc79smGrvPRDWzDGq5iNA7aaq7OgaquxW
	AcxV1b4PI3I2W++lPG3MTM9RDPCRXZU6hE+utM4Wh3FDwgxnl3kjg3QAVHif3q1J
	ctmKvMbbDQ3mxBTxd++p+SnsoFdaQ3gC1q6Xl2J9QXVfnh6RhaqjHQfURMNC1LGy
	o9eRKQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69y44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 16:33:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-535131e4c25so2163371cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 09:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118838; cv=none;
        d=google.com; s=arc-20260327;
        b=jfPmwgql+39NzFwqJXwqfM8IgnEEleB/jkcgmT5pp5N1PY4T9lat4PJw5A4MGqvBmk
         gaQArxaUjfj99pAVTTFhtqG0Q9fpSrOVqS7F+0M0XXXG58OdzCYnR0DpmmVX9+MV1lQt
         Fr8SKSWM9aIqoUxZG+DO97PbXAh8RELyfHTGl9fsniim7Ss06Y4e0JgBXIzfdZp371gz
         Um61Rsiqte44X9UsWJ7CD+9Yvobm70GRfHIeZfD+wawes8Ki6OVu73LpOvcHntdbZ4cv
         aF7bjy+vYIOq9ZptdoDh1ObVV5lhMcowhUGK2DQ2j5bjDvfEUc+q4qS2BSg7YaNjcrYg
         s1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        fh=hSEq5inxT7LD2vMccGL7dTrBm3fd+zNo8sHGG3CN+N8=;
        b=qumGuHxXneSe3HWvWlIywAsmjp8qnx7gRTRgnCpqn5vxFVyICcDOUYjnWuw9ju8utr
         FTAUSlT0Ugp5AYfKOs/TilTPDQeluEh53p9my4HLcZMsZdxaB4IObRlsw5Mf+ioNbHlY
         fi4DdSMlhOxLGKUIPzyfUM4hiZ/zBv/kvtWolR/dQWSldYM6nnsB/8RRrb710FniufeT
         VVvlP2EgoN5qnlp5Gl111mPFmTLePDD+ABFvL3hSg3iJwyOphUhZWD/DnyqUzjFszbEr
         OHqffRjDmuJN3Q4k9sfvtnpbzl956C7CHWv/l5rcNipUxrbzi/c28Tm7UhglraPUWx/1
         bErA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793118838; x=1793723638; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=GDsh1nvRWiinXQtkuSsj6zMKdAtT8BbL3opnTlAjy1Lt8T859k2r149YTyFNxV/2Jt
         hiV6guMQFK7hJNT+5Q+TQOIiAEi5xQv8CoIxo2w5HHOo4Xtr/zzsqCLJwMz144Ig71x9
         +uBiROCMUFjaCbYdluCj8MhkZgIGjs9meZAlc4kW8KH4XzWZpQxCKHt75v+0H0lIb9a9
         nAyRftrZ5rCmivB3YnIhBpKfy/vQM/9YU69vJ6vvXn8r6/AXI2r9ndaG1onbdhBtNAsY
         peF1VVYA8Uc/F3b7WhPKakgbtFSgy3lHm14OIoQpK76f518DKBmXuxl7Z66n+n3006/Q
         FvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118838; x=1793723638;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=OsU3aC59dnA489vCS77jLBKuQVlVvHjCbiLgPBVQ5qzZ1nCHoxpzhyyEWtM4YmVBca
         NLVKXo6AWWc2ovTOkYp1SSfymrZck26HD/Vi7RKe7TC3a0l0Kn6aUs0eUHFm/UZYlJti
         wLggx++INVBMHIHzAjGZUn+KzE47irTvgca0paay1QCEO5tUKJPEhfDmD0MTuJcc9e0/
         DIH4FRzvyQgwoG8aQrP56HlBDtXVHoDRlTpotFy/mMNKcwztfCp6nApFRSAdZmDzf3mD
         Ui5oqp04o7WbYYlN16+vEzUmAIuI7Bop7cSvpJRm/Q8DywuWvWZ3zOG+qBoX1B5RcXZz
         gOTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYIegkqwaI5w1Fc0yGjegydyptxoN+Nc/t9fe0mPphpeZ+2S7c8Ji6bnVpGcLjQhnv4EXS3D+5l+nd5XYb@vger.kernel.org
X-Gm-Message-State: AFq9FYIaOn9+mjyUFnVPqFyuaawn69rfeZO/kJmllmYhvTRC911/EDDo
	WdPz2yKokxGcfgDJmGEkHNGEt+iJ+MqvQXziEuGJMLbiJpk5U2hQrImlBuDFoZf3++0I6MebLu4
	yzNvfqL6E1MhbujlQv1ne4EKP+hGSgbPIBQFxomWB2F10aKMdArBx/fOth05xvj7cgxY6EHAZkp
	OSz9cbfkMtVWv0foX1lG7vKtHt+dAHEtllaJM0uNT2sfg=
X-Gm-Gg: AYBFou3+BHdJs1fjEEtSdTkJihhGGpmraL2w5nIIuWbau2TvIYy3d1bZIzO48+vgPIk
	LOCq+wmxhAjDJ9xy806EAgjw93OZKfFPyBXDJo23Zz4RU7EHiDcd6J/pXO0kZJwuPldlwNxHSRQ
	o/cttalQJrz3ka7vMMzB4vg7m8s/ow2ZyhQX1r+MhlrGkqXUnOgQP/W6xEvqmhM2goVC0sXX78U
	So8Ad/RCOP+FiuSJmZwfGiZWMPlHvreyojfwNcoNViBR0BzbL3XLw/Dn9d+/HAiASaf0zkGzWE5
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id af79cd13be357-940ef6833d1mr1472841885a.0.1793118838148;
        Tue, 27 Oct 2026 09:33:58 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-940ef6833d1mr1472839285a.0.1793118837619; Tue, 27 Oct 2026
 09:33:57 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
In-Reply-To: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:33:46 +0100
X-Gm-Features: AclHuK8j4mStUHhryvskQijmxQMRr1T1BTPG7p5KRrujFPF0uIKAlxEAa6i54Sg
Message-ID: <CAFEp6-1N_bUQouuLqLJdLWXx4e4o_8qoKdwa7CD-D9Jxd6MhnQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
To: david@ixit.cz
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0d276 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1LqAIe8ZLxqIxhs1lXgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6AMqZfFJBhav5QLtKpwiUDbeD67t7go4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfXwZxqnIPTFuzN
 Pv+QdeVhwpktDcf/OxQ0zdWKP+2lfk7o4XD334UYXQbsdYOVuaj5IC/PSMJYwmAqU5RPbbQPvtU
 ZpZmihDWGiVrSx8SpRGPr7Q4ZUhAH1E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX+vr2rec0ol4g
 EBU2d69bwKE5J/XUCdvFGzuTLCcTBvWcF63Sctl8/4Y4o7rtTwv3mjqnyY2Cvubpt6oCTXgnios
 CrIS8Y6YooDaP2PKoOXnpH+c3/9G4leSgAiV25EyR4kSksIyfGZTy2/yrf1Qy1GipfMgw8YQRjL
 5JNbtNJ5U7n5ttD1tTf1X7MP2s5nHdgQWqais10LWcpxgeUTS3DEO6AaXMsDFBF4JXpeNaARfP/
 1aWWXCNPmwX/8CpZJ2hzFnKmDB06K3xUb+17L9/FxcrwSkTEx0R26Z8ZU6roeVRjfm9GLKMtUvw
 isWLH5KveVnMdo9qe4QBI+NPtRbeoWCXU3HSItshLKQlON+i8Gsxxpz/6mw5Bl5O0etA3q415JF
 04pplAEHeTCQKt/nY//aa5FK2ZWMj3ltW4YCG4gunx3CeJyYcWXtoneULdfUDzIyBn/YR5WsUiq
 9sR8G5XO55uTaU6gYLQ==
X-Proofpoint-ORIG-GUID: 6AMqZfFJBhav5QLtKpwiUDbeD67t7go4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270065

On Tue, Oct 27, 2026 at 5:15=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The timer clock has no such relationship to the link rate. Both the 2ph
> and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
> where a faster link makes the settle count smaller, not larger: at
> 269.33 MHz the count converges to 16 as the link rate grows. The vendor
> driver pins the timer to 269.33 MHz for every sensor (it is the highest
> rate in the SDM845 clock plan) and streams this exact link with it.
>
> Clamp to the highest listed rate instead of failing, the same way the
> unknown-link-rate case is already handled.
>
> Solves issue on sdm845 that caps the link at ~1.02 GHz,
> so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
> Pixel clock is too high for CSIPHY
>
> Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on SHIFT 6MQ with sdm845-next-20260820-9.
> ---
> Changes in v3:
> - Added R-b and Fixes: tag.
> - Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1=
-622db5a6ebf0@ixit.cz
>
> Changes in v2:
> - Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
> - Fix the check in camss instead: clamp the timer clock to the highest
>   listed rate rather than failing, matching the vendor driver.
> - Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1=
-d360bf7cd38f@ixit.cz
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef2289..985171276ce47 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csi=
phy_device *csiphy)
>                         long round_rate;
>
>                         camss_add_clock_margin(&min_rate);
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for CSIP=
HY\n");
> -                               return -EINVAL;
> -                       }
> -
> -                       /* if sensor pixel clock is not available */
> -                       /* set highest possible CSIPHY clock rate */
> -                       if (min_rate =3D=3D 0)
> +                       /*
> +                        * The timer clock is only the reference for the
> +                        * settle count and does not need to track the li=
nk
> +                        * rate. Use the highest listed rate when the lin=
k is
> +                        * faster than the table covers or unknown.`
> +                        */
> +                       if (j =3D=3D clock->nfreqs || min_rate =3D=3D 0)
>                                 j =3D clock->nfreqs - 1;
>
>                         round_rate =3D clk_round_rate(clock->clk, clock->=
freq[j]);
>                         if (round_rate < 0) {
>                                 dev_err(dev, "clk round rate failed: %ld\=
n",
>                                         round_rate);
>                                 return -EINVAL;
>                         }
>
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
