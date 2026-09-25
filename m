Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE82B45FFCF
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343551; cv=pass; b=bJq33g4HEl2mphF739MntaO7FFSyi5pQloKqdaSt7x2md12pdG9oRLGav7tbXxWZYHBnafws3sGVfUU2jzTJHhld7Ni2ogH14lRcOkcPuFqWLxjviTcBQL9a7AhmiTV/2HAEwm+4nYJ3d0FGfWrr4805xFv5dzaI4DMVf52ewt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343551; c=relaxed/simple;
	bh=kqdNlwg778/987rRPFcemtjB5R0/alDQShoyszIUXi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZxoQFvZFFEa6hgQDmI51SHQhkVyt9ONzRjqH9FMAehvJsKl9YQiLJMQZOkEKdOytO7gfTlDtUPNLH72dRal5sxn54XzxERxAwJrQT8YTQM8pJJkEbi3Hdvla7lu4H8Y0sfav1lTz9THGj80ArHSnopINKSbIReLPvOVL3X3UAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CiFirrNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjLnN41T; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CiFirrNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjLnN41T"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5JER73627530
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:39:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=; b=CiFirrNMJE46vkez
	ab/ALVoKzVYq3KdM+wurlRbp1B6pozl0+xZlajKqHYhciUozzuBY7HlW4B9bEgeq
	01aTayxTFbLZjXcK2kUyA4C5CGDxayVgrjT12DPiulgqZp8+24MXVbQFUBKalGN5
	p9GwIgBIhMFeCrnL/r+4yFxTmyyyZcUvwHKtmgVueHEfPC1dTHXv2IcCvaA5pY9E
	bXsatblJpbCU9xw3/A1vAwABdtqMVYDxHNRpOtBokCQv+9P5D3KSurkRHYF8jsvl
	7RxWADkv+Ho9B8J+D3C4m7HNizpmI3Gz6NL7dRH63YIWrYea4jFZFF+zLX2j8bQ9
	XChfMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjq39j42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 13:39:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c444b438aso166364485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 06:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790343548; cv=none;
        d=google.com; s=arc-20260327;
        b=PvgsvBVeDVvoUR2PCR1CE52trfjr8fm6B6LQJjPUC6ucNG0at88G6v5LXiZZDyHSEc
         UtldjPkMwMYWtjEePk7/9HJU7xGfmTSPanIPmCe0mKuur+7OsZPzFt5JYWmFhpGdMumy
         L/RPh7f5c9mS4rcVfbKcZdxESniqtldzIOPy+CtkZu7jkMueiQE/0zNolUlVusiE+VKR
         gnYf1+cKXeoZ2WJ11s0y0k2Cxn+yT/aNw1UMmBf6E5r8LBft3MX9tINpKnGVJeva3+kc
         bCTYaseXsQ04T37B2Yf1M4a3m5/+Yi0TVEEF/qJWQvMSoI6/bZ4cvAoabb4sqxj0e1nj
         aNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        fh=em951Bma0Bhob0e0bqzBbj61lqycxQh7bef81tYmE98=;
        b=PI7MT7bbOGHA0NUyxsnMHqTY7WOs9WL20/GgAQ4gHT+mKlc9rRSy0zK6zA3pGfQcKU
         AAnnThv8Yd17wx+BajmSRRk2f/zGcXlfm6UYGU9CA5p8Mv+zy1o9ccMSO13Z2QFKcKWg
         skXUp/EhjgaDYrl8corCnF8ndNTAGxIe9qdLejmGXeuEATwgBZXCgozh6ojALOwzJ3hz
         rG2egUx4rP+fbpulIBEju3+WcLgYT+Q5f4Anixo7TXRUMC0xQTNlCcuV214Sxpn3BHJ0
         aDKaMd2jyY/0DUmpiWjhZfRf2y4QLTuiLh7R1whmqRMkYEEHhR8h+4kUIBzz1cPtlnI8
         5KbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343548; x=1790948348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=OjLnN41TvHXUGa7MBrf9fj+CrpaWlDp6jgP20kUZ79RYwBnqHsD2K/ZHsBfxJr0C6X
         5bLg4kK6XWXCGlWpS4+g8GmhWc5sivFMkZ6UPcPR0PfTiZKGAXGfrZJAn1JrUrO9v3pL
         +o/3NTphHMc1pEr1w9tuiniwaSWa84DJXKLHsZJBOqqauXJKVeciIGSFjrUGEe+xevFE
         0tu5GV/o/wBP/LDnwxL4ckGIva0g4Fy9erhgynszry1UC2kIN6hUmqZne6dnMQMW7GsT
         RLoI9Iw1mSzZIhFcCnl5EDBJRUTgLvqYhyFIIEVyfYO8DPzOfGwQ8Vznq6kgHkRZsrq9
         XTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343548; x=1790948348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDqgsZ4XGZtl4jjOzkJ5PS9aFgMs5r1UIrTA9EsegCY=;
        b=PZD5Q8ffMlzYqauzYLI4BjRSJb089kpTPpVFF0pp4XcrYdM/an3qBK3oDvJcCxuDZ7
         Z0tbFeoo1Jnf+INNd06F0y+GKUQW+Dz2+HDFhC684JCQ3sc513nKVsvqsz9HFN9NhcJU
         LWVnElTEKMV6pg0zlELI/LmHQx6VQrl76sKR5wBZ830Qdqsivn/46fe0HgasqtzB3wQc
         WP+Ry8ySd3/9VLKES7urClWs9bLO9979so8S1s/9LLQHcuIve0CoFGHEMpwwuhucE96M
         dFPT0QTOrvhZnIEhGkmRIs7j4V0AP1fgs1zVxOeRVSkstKjwxLXB4bor0nLVeCGepv7K
         2s/w==
X-Forwarded-Encrypted: i=1; AKwUvBwV+PP814ZFunfWLZD/825pGLVhg3PFlxjxG+hgMoAnMwgnxYWEybrUeQZlqbAk4U/rNi0vE02UFCV9YArF@vger.kernel.org
X-Gm-Message-State: AFuF++mLK34GYgeaTr5hJjiPyo88G1bgIH/UDBroOU7pTwaFHBeJvxj7
	edMrf2rnmyfXr9HfzGlKUE4vOHlXQIi17LCWEbkM7oeiFNxjIFsCBpYozs6Nky9CbK/NbNgNxL9
	Xq5DK4OlxZKAOQLw7Og3HGyoaZhV5kydyzHS/K3molEoJrGdto42EZ63ZtfWRhhsthS1AZhZDme
	glfb+MMYHdQQcGC+0nDo8Cvb6RrDUAvboAb+bnlW1Totg=
X-Gm-Gg: AYBFou1rMyeVZ+JEs1HLOEPzuapYAIVAfMoBBYuPxagczkw+sdXfCZFjrTJDExreqXp
	ONc9TBQGLfIu6fM3SKFBGPM96fjsFcMAWYTjXJdafo9GqCVE5ef6LUAQp5+5KqI1XAozqN1ga7I
	nwsVdgUSNNY+wCGEG6Klb7+aZiQuwXXRfyHvIOk/huT/095mJgedpIYBfQv5JP3DJRigTZ+jBvx
	YrisFXTmni4PnowweLXD+t3dIDTa73cbbRZa/PalqohqwaNoPHVDxBhDoiuFgonY6tbB2I7+uI=
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id af79cd13be357-93c43bf1ff2mr431890685a.29.1790343547646;
        Fri, 25 Sep 2026 06:39:07 -0700 (PDT)
X-Received: by 2002:a05:620a:4588:b0:93b:fbf0:8791 with SMTP id
 af79cd13be357-93c43bf1ff2mr431882585a.29.1790343547133; Fri, 25 Sep 2026
 06:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
In-Reply-To: <178998281449.889291.7893229102394463283.b4-ty@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:38:56 +0200
X-Gm-Features: AclHuK99T0Ubawi22EyQadvbidnQEmVlySi-fMkWCvta4a9Udx0OX1G_I0L1lvQ
Message-ID: <CAFEp6-2P14MdYJGuH6ygRL4ZKtLnJEj=PVMx2p+b9L1RuiX1dg@mail.gmail.com>
Subject: Re: (subset) [PATCH v10 00/10] Support for block device NVMEM providers
To: Jens Axboe <axboe@kernel.dk>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Christoph Hellwig <hch@lst.de>,
        Piotr Kwapulinski <piotr.kwapulinski@intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX+JRxX+JfwdmZ
 BaN9UjDR7UXthyKXQ9/5U2gxHhg4zw+VP0bLT7sXZqUoEbD7IsAg8ruFqrAyfxFKULrqFH4UKgE
 LxelNGOyquKBHfMmAC9GQjXiixIW/Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX62wC3RiSSH9F
 B6aVPssauBPM0gvda2tFiIZzZvfSdzwAFMxa6Z0tFowwhKoctmEtvVYAld7chEZyxPY+TC80wou
 2e0u5sUL4q8qrwnZFP7ZZAodcsIBehjAKpU0oS8esvBxt80RMAzDMVW8yytp0xeqZKEje4Cb4ax
 pgQ6m8wiuSMN4gzR6SjJbaHllJR2OHnPoxpFGIZhX0TMz0A43tPrIpVG+3OzAKDmZjKizFD2URV
 aenQfER5dbI/Hn0zi4NTRrzxuY9xp9HKTtLDcfexJCnqic/CXW8It2qZBv6pYV+FubJA/ZCJ/Jh
 OMxcPR7ZO5StRXF8oBndy7lAIRaYuPx8vB/vHtB54LisKWN6yo8Q+hhI3UmL/vntCMOnbTQZhNW
 yVLLu5wDPdZfwJpc8h55iLNcYgxn6H6MfCgpCTbmXAJIZMNB0Hii+iQxX1me+ory1Zj3RDYof7M
 hP1CbFuHf3MsS3NQDVg==
X-Authority-Analysis: v=2.4 cv=VuO2kO2n c=1 sm=1 tr=0 ts=6ab6797c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=MW6_J8xfeE2cRKj6bkYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: -hlpKiVJYybmmF1RD8P6GNOPtN0LhdYz
X-Proofpoint-ORIG-GUID: -hlpKiVJYybmmF1RD8P6GNOPtN0LhdYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250054

Hi Jens, Luiz,

On Mon, Sep 21, 2026 at 11:27=E2=80=AFAM Srinivas Kandagatla <srini@kernel.=
org> wrote:
>
>
> On Thu, 06 Aug 2026 16:38:33 +0200, Loic Poulain wrote:
> > On embedded devices, it is common for factory provisioning to store
> > device-specific information, such as Ethernet or WiFi MAC addresses,
> > in a dedicated area of an eMMC partition. This avoids the need for
> > and additional EEPROM/OTP and leverages the persistence of eMMC.
> >
> > One example is the Arduino UNO-Q, where the WiFi MAC address and the
> > Bluetooth Device address are stored in the eMMC Boot1 partition.
> >
> > [...]
>
> Applied, thanks!
>
> [04/10] nvmem: layouts: Support fixed-layout as the nvmem device node its=
elf
>         commit: 9c6cab93dcd47c3075d896c777567b9d8f813d18

If you're happy with the current state, would you mind picking up the
block-related and Bluetooth-related patches in the respective trees?
They are independent.

Thanks,
Loic
