Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9346248F03D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820947; cv=none; b=O8+0EEhPhP+mV2eT6M+GeYDC8gNSeWOUJNF8oaU5qXvpOrAMbRd3Qv56gyIRyLmDqOcP2cDOsPbA7l/YUuvrm4gMWU9kOnSsDJFhyJ6zPpbnPpmKyGFVloiGgkty1oKVRiCGMBmA3CkEigg5EmgrTLtnWGJ8EKaX1fm+lksR/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820947; c=relaxed/simple;
	bh=8CAIVnvJ/rPVzHy5yeUahkVZQrOPcNAKX1mzVBJ3LXc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K6Bck7vlqyCDnfB3Fhfl3inV9qiZnXDKToP5WGTkakwlw2fggZNkEN0wCp22lCByqPeFmZU/+gnfYoX+++wuRNQnYcIP8AMk97pGa/m++jRElibH0eAItXJSt+ZXM13kfKZiKiHONFiD0PAA0HlLjOTj4d0AnejhXa5tl+V2ANM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr0FKQ3D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUjvswAN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gr0FKQ3D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUjvswAN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFf5mo2420067
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=; b=gr0FKQ3DyCs6RxEU
	YQfBCLKqIkZRp7ceAUtX4hqD7nfSvOB8cgs1LI0wi6LAaheUE9u1SXsHnllG++G+
	bb3+B2lqp1vcjYZ6Bbv1vcbf1hOrIhYg4MBkogty+lzjTKqPfgBAB8c0E4K1RJ1Z
	mZclxaLAbLs+OyOUCj7aPuH9Fd/t8ob87HGhRBddmT22jRvxT0dY0QgNhK7/7dsY
	Gq0dMgeOqkCXlkKZKxOvTwAFQBsYxZCF0CilSEX3aJaInQBdu4IsBIpPPB525E63
	ZIX8NTtIKDjVEf9Pv7f/xpL5vacqH8+Rp3EFHYmX3+c67c7JV7JGbKeYRrWSI/b8
	3i6Pwg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkk24q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 16:02:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so4258881cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820944; x=1792425744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=BUjvswANOpIMSAcQiaaZADshbLdgU6446I5nZGBnS5FibtPQxCTclbXdPm6gtD3ESl
         CyIACOcRUUKhsFIIrfGv4+ccEK8DJLOw/HkQFvqdO1pnCvGCPActTqP9LQat1rKnT4UO
         vMpwgQxKsQyZtuziJ6tXOAGqsP94dxIgUiFky3c/qGgmLuwIv3snuDABQ16hPbWlGb0u
         YIMn+rE0DK4YRw5eI/Og9uItSiK1mchNZxj4ezQxZZVQ4opD6Acez0WU4igzvR0GrygY
         oIevBZH5WZhSZ6K5EVYgkfGcJNSjxigK+OM9NlxJrqTUNziRTO6926HlA7XZdtCLBXHs
         5Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820944; x=1792425744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NgG1CUCMKjXxg1i7tGQjclcS+aKmUC8Dq0Kbz+Mxni8=;
        b=uNa6Fw+EzUcmYTpSCvKdeWf5lQB1jsOERDysR55zfXX5ytNBLpNdWfiBwBmlTeTovr
         R3I7e0u7k9fZl7zgVUjf9xa8aWJNEJgwvXN0SKmdpneEkAH8aUsKADECLmipImfkyAtd
         /HJq6QLxvSpFmQwJKzDIsnltW2klXq5wDX76/KBGevTx2Wt5k0Ku5AcpzKPr+lPzHSEX
         44HVvsju+LxjIShdte/jU2TFm1CmaNk4BhmXVhegVBgDgxlp41eFCQkiVgHMwU7EU2Rd
         NCCfU6TOdgLOsPc0XhyhnH9ZEjJT+qF0QTPrtLVv5aukfsr+gJxYOT7smnIidh6/RPL0
         pfFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwJ3RyfNZmO16gQSrtlgv9B3ZpDIr6ebRziJ88sU/VqdPa+W7CDG45DT3p21Pu+ZAG/A4OAVc+HznoJ6dv9@vger.kernel.org
X-Gm-Message-State: AFq9FYKlsp3BWkR4Wvz/wiyy/f9GjiiILaPpoFdcglHUnW/u7X0++kYi
	feb8ITskWwOCMyqKEhq1Ekh5tbTBSgsG8E2OOGSG0hNi8Peh+4J9sCSREraNEq4EWzBtkbUCf71
	zP5fW6xNWdqHHBXftyU2J24cPyZ1ts/WWnI5P6ZTrvbeptF8k+iOs1om/0T9FjaGZKkz8
X-Gm-Gg: AYBFou0wdJBamYxN67LtI03bC6CzL+j1dzkA0f/nHMwVC+QcQW2zxBd/mS2QKH4WEgT
	MKSYwboNV34YodP7OgGZqxmRYClluAwxbWVASEg8zNVAmXvJMNPR+jXTNjyo+65kQOXnAzAKrur
	bQFy23JIre3bk7Rw2kBrcunUWza0Zt1swo1tRwhTt6+/1Q3XGxmpaZToEX9lxcKZfvwSO7lk9cf
	zrAOSB3XCH76DaQhQi9lHVfvWfFNFPpjY0Qc94rAHBx/TCAhEhPJZK8IIYwrKZJ7D71S0Qh02fX
	h3ZszhO+uyUVzKAcrpoKgXaTXK0bvzGJByko2N5e6ZlZwKlViSebxZZgI0GoLte1qGX6IRkFDky
	tOSX0g7VihtB7zKsNGoIWkg==
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035467485a.3.1791820943772;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
X-Received: by 2002:a05:620a:199b:b0:939:eb09:4458 with SMTP id af79cd13be357-93ebd1de450mr2035460985a.3.1791820943171;
        Mon, 12 Oct 2026 09:02:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1bbb3fbc6sm1758143a12.29.2026.10.12.09.02.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 09:02:21 -0700 (PDT)
Message-ID: <51552a90-60bd-4b87-8bc6-080d49e030d6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 18:02:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: define a fixed 25 MHz clock
To: Alex Elder <elder@riscstar.com>, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org
Cc: abelvesa@kernel.org, kees@kernel.org, gustavoars@kernel.org,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        danielt@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel@riscstar.com>
References: <20261012152408.3729237-1-elder@riscstar.com>
 <20261012152408.3729237-4-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012152408.3729237-4-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX9l466RQ/HDQA
 5tmT1lKUxgJRoBjsH+JGq7HQG0N/sL9JHpMr4Dd6mSozuMsWF6W2bhLLh3oUDUnPOTxsirPvljJ
 kVW5mxi3z44ksxn3nfs3uR9D+DsgMYAqDiLJdlj+9r3daXr2E/7e5gAsNvjeWz9hbKhiaTx2i8E
 3PHfB1JVWQznGoklqVCtO52ATf1kPnXPWaLVCBlu0Oc1Ado/pJc5jnDUgaA5TR1G6rcgFc0eLbc
 BvVrxXWHeSEJaJYRHsvYYG8KvBH4Krnh6d2eyidGLf4JzCL7uAbrGmoUei/swPK8v5WoGtLfKrd
 Vm6dZH61MNve3x8tu/BqEbPqcPMmCpBuXgxtciFXscn32YhlzPqClHJJ2/RwJWrzBrRn7eGqVMG
 YI3xG/AvyNQSawV+wPEewfT95tfT9O256cQIvycWkVCVU40yxF0FMkrd04+mBnRdQ8DncEeSvHM
 2YzMGhceRzsqq2T3PUg==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acd0490 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ee_2aqc6AAAA:8 a=kRlCQ1XAc8RtWyVnr9gA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX2jQkzvqNuS7V
 iZ8ruPNaCssOhHBnh3I2KiaHz7DGi46xv2qSHW48JTLmvFJe3P3AE4Wjyhyd8+OmAB9oXxQwF+G
 j6fm9Uo24L3caJCCt5LmV0CNHaqgv2g=
X-Proofpoint-ORIG-GUID: L5WePKmEqLNNpHxFGZUX7BW3dqufTTwV
X-Proofpoint-GUID: L5WePKmEqLNNpHxFGZUX7BW3dqufTTwV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/12/26 5:24 PM, Alex Elder wrote:
> The TC9564 SoC has a single 25 MHz fixed-rate input clock.  Add it
> to the definition associated with the chip.
> 
> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
> v3: - New patch in this version of the series
> 
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> index 0e3bbdaf4661f..b8d290eed2f38 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> @@ -891,6 +891,12 @@ pcie@0,0 {
>  		pinctrl-0 = <&tc9563_resx_n>;
>  		pinctrl-names = "default";
>  
> +		clock-25000000 {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <25000000>;
> +		};

This and patch 4 should be squashed

Konrad
