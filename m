Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032168;
	b=Es5NVicocsZrirrPafJofwdITfrORHhMXwc5Qm0E+DJ6k5WklR5sPC4je74HX+ehp7OS
	 vtaJaaSRUcNLJ74b30W5RbOcPJmJ3smSBC1d7pSpuc4OO3fogqgGL3N0AMS0K4w3E43vv
	 yDwjtC/HTTXY53sMGuUii/J6Ke2vG5CeUpiu1yo9psDg9w1KzZ32c3VezcG/nzf7Aoi15
	 7UcDxXUerJLVgcOiEdCssnQtfJXUS3IqCV9Tk0HXpmef9XBb4uwSfB9CpnyQeyJDbTn7h
	 REaLwtDocX3Io0uGV7IYhpsFyGg+n3hEvp6rxJFc1gaIG0Le6AYNsqUMUun/6Q1/EUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YjdnKwB7shcLTNdlqy/kenBsugFEdtE3nLtCOyBbHW0=;
	b=ZBwduvlBB+xFdPukbrcvPRO0Gjh/8Z5cSpcm/kmeUYYEOoX6GUvLRBG6/ytR3qbxXW+Z
	 7q7Fz/0bwfPZTXsmjRfOKA0uqClu8fuyMjrk/nu3NhfhoEmzKlENt6TtQ191JX5tRaB4g
	 +6WT1o4lcpghRTisEGUFx4ugGvBk4xm+VH4JmG12Y7s4fXvnsqCdqBe2oYwE+1VjyvICC
	 ichPKHFM4Lah6kpKgayDpyjk7UTcueo/0ITvv0FNooATxmxO3V5Cge4qESafR0ctbHKSU
	 C+rD6X10Dqg2iD5VB3xPPG1zsgNkvsCVYBytk6RMcx4IZPh5MGvPjWLoGMjofijEe0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cUdJr7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQ5BesLw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C62606A33D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C62606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=h+cUdJr7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aQ5BesLw
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEwS792082549
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YjdnKwB7shcLTNdlqy/kenBsugFEdtE3nLtCOyBbHW0=; b=h+cUdJr7+BRzJzeT
	YgafZVaDdYFIq+s3+BF0vq00/8XG8lU3mdng4hUzyS2gnJ3Dhqb0dK6aZ8NhKqI0
	yhMeo4HmRT5Pi3ZIW161wF+TQwMpJ+uu3UnU4+ou6BT2rUY95wpi0HGBoywmiezl
	9YojqwdrDHaGmLSaboTDORkrXZ/FfJqWus6tRReBda8VRIGYQe8NyGqN8WEg0CMe
	MtZMSGap4qyRPF0uQ2CwuwuBTWKnw9bSVgcTPvsn48Pic8jmMqks0kPPMaP76AqH
	S1MHDN+VGUnfxeHRxitZhdBK3zF1KsiyzNDi0vT9oIYU3dKIp11i9lokprKCeB7T
	s4wv8g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgsuc0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:29:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so818560685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:29:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793032165; cv=none;
        d=google.com; s=arc-20260327;
        b=knjCQItMpfdtYrNGkR/e5igeZU8nZrwGidwO3xXt5orHZBpyKQvFILmH36V+4cb5Ky
         BlZBvZd0sJ10yTp1mp4i/MtycxvXG/TjXn1KrHlEIKpRvFHO5bcB2ZcQgjuVK1tg+TO0
         mJVESIn0xZrrQi1xVuWHZhgw6Ox/d+r8D2XAN3ZAqshKae2eBUC5wn09sLaxCD8oSFKO
         a1f37TPMhK444j1AJzc8Y5174fHTStnJKXMSCPXBjX+l2JxQp4b1I84KFCIliJo8QiFO
         cODwn+dnw5NrMlBRiA8WxKYRY9XV3ZI27q3z5iYBTPUMAcnaa71xFs/sE5VbpbagkRRY
         IxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YjdnKwB7shcLTNdlqy/kenBsugFEdtE3nLtCOyBbHW0=;
        fh=GGc/DSqNXyPeBvXXUsSHDFCoSd1EUAOdC9+4oEQiDqc=;
        b=XGDIHj+j7jgAq05hMMqZnaU8Xu+8rduErw+vjfRbmGk+Fqy/K5BnPQrpmivRu7iRu7
         9L7xSO81zgvuRMTtNgsk7aELcow5XmrRUkgEZyATanuo6GrGmXF+c+5qQuk/P9x+n7Wm
         nvU/fpB8uJBOdYsDJRXJO6oz/ww7ewYJfHPew53502W2V1x+zJuc6fNtrk0HoqK5zjcb
         t97Vgs3XVKfSirSsl5CLOFQxCh4G5pDiUJ6kQKAPqWc/ZeWXKNd85xzv/EE/dmjcxoGg
         uEA5WoF/8RBeC8cmxPghLS/ZTd6kWKAfo3tcDvopaVNYPp+GM7Uh+11SKaJQNuz983Q3
         OZ4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793032165; x=1793636965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YjdnKwB7shcLTNdlqy/kenBsugFEdtE3nLtCOyBbHW0=;
        b=aQ5BesLwxmJBK9HC46JaY2Z80uWQDkQ6gV17X+r23CQbAw65nspOKgKbx+uUyOm0Sd
         W5Va47tSxCXK+6r0jF3IVcRibzieBDAfOE7KH2FFkQenVjaXrBH7AiA3Zq+N0ACKPbIb
         2AJIB/GuaINP0HDsz7cx5vfTOEIMGTSdrCLPxVhytDf+ZDi+BUMRKQ+Itwtm3TzDRl6B
         rgEnCXs/GUS8hrrecqOfLFSQYAykN+zGtSfuOrueLzQTlUPaO/nmPvg5py8S35wTzBmb
         d1KdidXnYXR+7UoJglyIv35AJytSBZL4t9nQh5agsrjPHkxWqIW+Ypk8AID3QNqW/x+j
         gq2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032165; x=1793636965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YjdnKwB7shcLTNdlqy/kenBsugFEdtE3nLtCOyBbHW0=;
        b=s3L/Rz83u8dra0QosdHTYvagZ+eJ2W1sgBl3Y8KwjgCnab8ovCkrrQOW7AGzVzcyh2
         l2RtLhoHJ3M7kIoKYvaJyvzLGA5N93+xNcrJDmiifDbjGmfPywPLOjTZZgvt7w/A/5dM
         K1lXgJRvNmMeUyZEHWx1qnDggv2xdlKi2H4G688FF8qc1fxPiuYAIF54AkwntFyYpuwt
         9lOqCLz3e2PdVlAnXLXT1xJ2DuVVXhkWMZ9LzaitAGbiG8m9I7r4XAT4iB0e29oTtISb
         XCsNDuxti7dU95hvnj8/FYyqoduBVpAPuwTjKNONatvRGkM5+607P7DzP3w8fmxrnXr+
         Grjg==
X-Forwarded-Encrypted: i=1; AKwUvBz6YOEsPnWZDqUYzqPEcEpd042HdeD+hbADzOZd4ap0kcMtBjmBQN/eth+ClvUo4a7IckDObcyqpRrVkUlK@vger.kernel.org
X-Gm-Message-State: AFq9FYKUXnc985uAzHaQdQHAIpFkd1SzKLfhgk5x8e7eplvKPiwO9VYq
	kq9tUbkjvZDOnzzWRE9ORas6DRFLraQcLQtEwxsw6Hvjxh6H3Xn37efU3g0qz1NH7aujx2pmfhN
	IuqTVO4HGNFtyKG9lLE48N/9W2p2IkpqQewb4e2WdkL3DSz6DpVRIClPO+y7I8Sd9hlawsszayB
	F56XDEKwi1msNNwjAw0+306hrfiSgyTqZGnYLIwnzdDXY=
X-Gm-Gg: AYBFou1+c7F20zyQA6GcIxsHU5lAGWxXzxuKM4gUPMYrMDeGybfll++Zg6ToyDpr51z
	mWPH2yqu40itFMiq2yjB8MwOG/H4HjjCZfNokm52qULU1++WPkLabl8B6USpwPqlOHkP2ta0uNn
	0PLluW52hmI+sr/XPB5/vtqaUK0J0oaApscy1YOFS4YELjcDFQvwhgqBAsGFFmvBPexbcZl/yAN
	149kMpzH0Y9XiaQGsGbP7hikALLK+CLdanLcBQ/K1lg2QaGJLZEyQsddycZ9JSDsnwwAZEMkr2m
	HhcWJbbb1P1R9TP3xZysCbyDHM8Q
X-Received: by 2002:a05:620a:27c5:b0:93f:1437:2e58 with SMTP id af79cd13be357-940ef914385mr957904085a.56.1793032164984;
        Mon, 26 Oct 2026 09:29:24 -0700 (PDT)
X-Received: by 2002:a05:620a:27c5:b0:93f:1437:2e58 with SMTP id
 af79cd13be357-940ef914385mr957895985a.56.1793032164298; Mon, 26 Oct 2026
 09:29:24 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com> <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 17:29:13 +0100
X-Gm-Features: AclHuK_JKR1SVk6uPMnZR0iDf2r_3OYwYu8xLMMtMTGGblBZ-5f2Bk-3mFCetQw
Message-ID: <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX+0Uqgdyf6DB1
 QRfGRjDBsFZKtjShm/tV7zS0Be2E8w9Gfl2efxlG1KCc95TxcIlIC7acaETYHix7y3CpUAnLg3U
 WoOhBtkImuhBhdkoKEYm90fuAcwbslE=
X-Proofpoint-GUID: 6W5D0bEas0kjaqA8ZRiVAVyJKASdGq19
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf7fe6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=43IZyKVBBk2jMrlFSD8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6W5D0bEas0kjaqA8ZRiVAVyJKASdGq19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA2NSBTYWx0ZWRfX+wvDG8qMLuJQ
 goTvO7CMcaNzJeVypPL7SD1AeWRHxlB1vPw84x8ZCqSsxMKl/E5xosm5jHPCyBYTSZmDUSUnAAn
 HwHLy8KmuEaACpplBXDdmc+flRDODyZ6i2/B5FiBYHZ17qRm8M/jpfUe63MEYlrohPeF0YT202S
 Hg7cpdVgiZsYCwXEEgj3bKZ/QyfCLzAqHbj7orgvKpCVTJNrlo9g+CvOgKwdmq5/4J5iu2MyBHc
 MgxKhHPc7HOwdz60ZfUHHawo929oBT5guVJjUO0pucUe16XMxZZRGZit5kiAtn9ZO9kXlG8eSWY
 QIbRPb3fDjPI/7kDNB9n66Ed/+Z2HYYjNkczINpp8DEzVybtnr7SEXAJbYxTsGGWGDycJFgu1Vh
 zicxZfI0M5eXexH5ELwa6sdhFTGjbeo/sAzHjTKTBXc006Jbubgj4FYO3nwjMhjWnJgS6v2QQ4k
 ZQNzLGvdyiKT+WLZYNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260065

On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipeline=
s
> can be enabled by board device trees.
>
> The camera subsystem contains:
> - 6 x CSIPHY (CSI Physical Layer)
> - 3 x TPG (Test Pattern Generator)
> - 3 x CSID (CSI Decoder)
> - 2 x CSID Lite
> - 3 x VFE (Video Front End), 5 RDI per VFE
> - 2 x VFE Lite, 4 RDI per VFE Lite
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 399 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 399 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dt=
s/qcom/kaanapali.dtsi
> index e48a179d0722..11df1c7c6e31 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/phy/phy-qcom-qmp.h>
>  #include <dt-bindings/power/qcom-rpmpd.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> @@ -3597,6 +3598,382 @@ usb_dp_qmpphy_dp_in: endpoint {
>                         };
>                 };
>
> +               camss: isp@9253000 {
> +                       compatible =3D "qcom,kaanapali-camss";
> +
> +                       reg =3D <0x0 0x09253000 0x0 0x5e80>,
> +                             <0x0 0x09263000 0x0 0x5e80>,
> +                             <0x0 0x09273000 0x0 0x5e80>,
> +                             <0x0 0x092d3000 0x0 0x3880>,
> +                             <0x0 0x092e7000 0x0 0x3880>,
> +                             <0x0 0x093fd000 0x0 0x400>,
> +                             <0x0 0x093fe000 0x0 0x400>,
> +                             <0x0 0x093ff000 0x0 0x400>,
> +                             <0x0 0x09151000 0x0 0x20000>,
> +                             <0x0 0x09171000 0x0 0x20000>,
> +                             <0x0 0x09191000 0x0 0x20000>,
> +                             <0x0 0x092dc000 0x0 0x1300>,
> +                             <0x0 0x092f0000 0x0 0x1300>;
> +                       reg-names =3D "csid0",
> +                                   "csid1",
> +                                   "csid2",
> +                                   "csid_lite0",
> +                                   "csid_lite1",
> +                                   "csitpg0",
> +                                   "csitpg1",
> +                                   "csitpg2",
> +                                   "vfe0",
> +                                   "vfe1",
> +                                   "vfe2",
> +                                   "vfe_lite0",
> +                                   "vfe_lite1";

I think we should probably start adding the CAMSS "top" register
region as well, to provide a more complete description of the CAMSS
hardware block. This register space contains, among other things, the
CAMSS hardware version information.


> +
> +                       clocks =3D <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
> +                                <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
> +                                <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
> +                                <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>=
,
> +                                <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>=
,
> +                                <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>=
,
> +                                <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_CSID_CLK>,
> +                                <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +                                <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                                <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +                                <&camcc CAM_CC_TFE_0_MAIN_CLK>,
> +                                <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_TFE_1_MAIN_CLK>,
> +                                <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_TFE_2_MAIN_CLK>,
> +                                <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +                                <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                                <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
> +                       clock-names =3D "camnoc_nrt_axi",
> +                                     "camnoc_rt_axi",
> +                                     "cpas_ahb",
> +                                     "cpas_fast_ahb",
> +                                     "cpas_vfe0",
> +                                     "cpas_vfe1",
> +                                     "cpas_vfe2",
> +                                     "cpas_vfe_lite",
> +                                     "csid",
> +                                     "csid_csiphy_rx",
> +                                     "gcc_axi_hf",
> +                                     "gcc_axi_sf",
> +                                     "vfe0",
> +                                     "vfe0_fast_ahb",
> +                                     "vfe1",
> +                                     "vfe1_fast_ahb",
> +                                     "vfe2",
> +                                     "vfe2_fast_ahb",
> +                                     "vfe_lite",
> +                                     "vfe_lite_ahb",
> +                                     "vfe_lite_cphy_rx",
> +                                     "vfe_lite_csid",
> +                                     "qdss_debug_xo";
> +
> +                       interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>=
,
> +                                    <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
> +                                    <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
> +                       interrupt-names =3D "csid0",
> +                                         "csid1",
> +                                         "csid2",
> +                                         "csid_lite0",
> +                                         "csid_lite1",
> +                                         "vfe0",
> +                                         "vfe1",
> +                                         "vfe2",
> +                                         "vfe_lite0",
> +                                         "vfe_lite1";
> +
> +                       interconnects =3D <&gem_noc MASTER_APPSS_PROC QCO=
M_ICC_TAG_ACTIVE_ONLY
> +                                        &config_noc SLAVE_CAMERA_CFG QCO=
M_ICC_TAG_ACTIVE_ONLY>,
> +                                       <&mmss_noc MASTER_CAMNOC_HF QCOM_=
ICC_TAG_ALWAYS
> +                                        &mc_virt SLAVE_EBI1 QCOM_ICC_TAG=
_ALWAYS>;
> +                       interconnect-names =3D "ahb",
> +                                            "hf_mnoc";
> +
> +                       iommus =3D <&apps_smmu 0x1c00 0x00>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TFE_0_GDSC>,
> +                                       <&camcc CAM_CC_TFE_1_GDSC>,
> +                                       <&camcc CAM_CC_TFE_2_GDSC>,
> +                                       <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +                       power-domain-names =3D "ife0",
> +                                            "ife1",
> +                                            "ife2",
> +                                            "top";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               camss_csiphy0_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               camss_csiphy1_in_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +
> +                               camss_csiphy2_in_port: port@2 {
> +                                       reg =3D <2>;
> +                               };
> +
> +                               camss_csiphy3_in_port: port@3 {
> +                                       reg =3D <3>;
> +                               };
> +
> +                               camss_csiphy4_in_port: port@4 {
> +                                       reg =3D <4>;
> +                               };
> +
> +                               camss_csiphy5_in_port: port@5 {
> +                                       reg =3D <5>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy0: phy@9523000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x09523000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +                                <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy0_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy0_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy1: phy@9525000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x09525000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY1_CLK>,
> +                                <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy1_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy1_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy2: phy@9527000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x09527000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY2_CLK>,
> +                                <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy2_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy2_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy3: phy@9529000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x09529000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY3_CLK>,
> +                                <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy3_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy3_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy4: phy@952b000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x0952b000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY4_CLK>,
> +                                <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>=
;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy4_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy4_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
> +               csiphy5: phy@952d000 {
> +                       compatible =3D "qcom,kaanapali-csi2-phy";
> +                       reg =3D <0x0 0x0952d000 0x0 0x2000>;
> +
> +                       clocks =3D <&camcc CAM_CC_CSIPHY5_CLK>,
> +                                <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
> +                                <&camcc CAM_CC_CORE_AHB_CLK>;
> +                       clock-names =3D "core",
> +                                     "timer",
> +                                     "ahb";
> +
> +                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
> +
> +                       operating-points-v2 =3D <&csiphy_mxc_opp_table>;
> +
> +                       power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +                                       <&rpmhpd RPMHPD_MMCX>,
> +                                       <&rpmhpd RPMHPD_MXC>;
> +                       power-domain-names =3D "top",
> +                                            "mmcx",
> +                                            "mx";
> +
> +                       status =3D "disabled";
> +
> +                       ports {
> +                               #address-cells =3D <1>;
> +                               #size-cells =3D <0>;
> +
> +                               csiphy5_in_port: port@0 {
> +                                       reg =3D <0>;
> +                               };
> +
> +                               csiphy5_out_port: port@1 {
> +                                       reg =3D <1>;
> +                               };
> +                       };
> +               };
> +
>                 camcc: clock-controller@956d000 {
>                         compatible =3D "qcom,kaanapali-camcc";
>                         reg =3D <0x0 0x0956d000 0x0 0x80000>;
> @@ -6548,6 +6925,28 @@ pdp_tx: scp-sram-section@100 {
>                 };
>         };
>
> +       csiphy_mxc_opp_table: opp-table-mxc {
> +               compatible =3D "operating-points-v2";
> +
> +               opp-300000000 {
> +                       opp-hz =3D /bits/ 64 <300000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs_d1>,
> +                                       <&rpmhpd_opp_low_svs_d1>;
> +               };
> +
> +               opp-400000000 {
> +                       opp-hz =3D /bits/ 64 <400000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs>;
> +               };
> +
> +               opp-480000000 {
> +                       opp-hz =3D /bits/ 64 <480000000>;
> +                       required-opps =3D <&rpmhpd_opp_low_svs>,
> +                                       <&rpmhpd_opp_low_svs>;
> +               };
> +       };
> +
>         thermal-zones {
>                 cpullc-0-0-thermal {
>                         thermal-sensors =3D <&tsens0 0>;
>
> --
> 2.34.1
>
