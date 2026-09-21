Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29DF44B663
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982082; cv=none; b=NsBmMDoWiNzHbMrqtLyXxYPkXiTQa3iOA3/T95FDYiuUipPiSysBNZ6u7uim92A2swsN+pGRLcgUO9+aiF7yhl9HwdN+sQfsAuxTAzQPPOwOoxUxcn4rTsu59ziBY7DoKs0JvUGIswzd/7M8kTzhRB3SSXjIGdHwsUTRPrVgzVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982082; c=relaxed/simple;
	bh=StpBKYXiF70ZVwwZRabcR00ad6ecbmwXV8xPpWHL4aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mH/H4oTTSa+6F6GgzM7+0SmS3WHUN7zrn+h+wpCQrPaPz7s5YfFoapbzsmrvx5YahyFCc3KvVAK2rmtDTDLF5JRJjceiztQGGjIbNU5MrGSdFmyRKI8wL0vHfU6/0J7SQrn5Mp5twalCCwNnz8EHQfywENE6+5xpMlktswu1J0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M4KLDfDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PdYV1zkK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M4KLDfDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PdYV1zkK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L84PV14134690
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:14:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=; b=M4KLDfDAps85j2C6
	LKJhhXOw7xNehq1o9OC8W1LGSDa010tFXeX5/IFyNS2oDZev2izY1C4dmQgwxCJr
	R3aqh37YDcE9gfLrajdJwXcjUnLBMQDeimcjQE7NKzfeHB/rzeS8JhFgFaCOwlIr
	aQ70Nuys7yUeLoIOMrObEeGYII2KjRWgObxHj1h/lHiQrSygZltoiX8ft6q34jtt
	CqIaVtMsHTujW/r+hoxEK4uqXqfJeo4KhsRGKZogLe38hMpnraGdzRFDJrjW+vT1
	FtY7xipxEv49VBy7yjvuYqHF/285UsdD8QfathYFU5XR1GJpw2UFgfTt+YWc5e3n
	3z81/w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu0rj09uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:14:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc51591102fso4095364a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789982078; x=1790586878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=;
        b=PdYV1zkK0HmuVZ9uGKSz4LOnkveMm7gDDrornqryD385NwFeaknzrLRhMpLn4zyc3d
         gddxwt7qsTMOjjErdg+yTF9hWjp5M0JgJsEfiNc6JukDdmbLgeaEkMiDAXxiDC9Kqs8w
         6VIR38PDRFzewtd+7vg/igmoQP2Wf+mDa0hHr0rrFIy6FLgPzH1F9OzKQyUZd2LQRI13
         TFkk7BSpjkv/rs9R8wFg93gcYdEB/9YKIo4OL6UcLVFJwYWIQ1XkYhOC0K3FqG7BWrUk
         tLfK9Kxw0xHhilLnc2nQURanin8CNerHrYDsrXS7/Gx+FW0+QFq2lNrYp5rigPRLw0rn
         0tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789982078; x=1790586878;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xo9mLOJxXk39j262pHvfRN+qFVuAlK5ekUKavXq4SFQ=;
        b=B5IuBxGxJbz1NCnZDw5NK4WojIiGuXHHb05MDgxs3IJdTJwP/JcbsA+iR3wAOHF24O
         S7hwpBwLm2sfFcTp8STQvhWbYK0Pgst6/aM6UCkSDVWmVg1xhUXrbBdveQfxXl5dF6FS
         AXvcqVX4EJV4fgjQuW59jXAFQEwzc4T2ilhzrBdDy2dfaUKksz+5QtUh+96ZGTm9s1IP
         btFjq7uRVlPBw3e/WcfmX+4Bi9wZ6EhtFWYQwugH/7kQs4RqH5pl+7ZRHC6pgL7WwObN
         sb1lqykqC3BIsvmdsMiGXpsIhlBNqWqaFt8fPaYmm3D07ntyQloTAnRklGpxl0mK9Nh2
         xjTw==
X-Gm-Message-State: AFuF++n55Vz7a83B0I4bwFYpJVZHXZ2SDLSaq91vBYPtlmGGfZXC/hFO
	AwE9IivOjjGF/JLfmCmSfJUNdGomJwFebwrQUQQBrXF/y3qr/nFKEx0U5m6cTloWccUQx7Rm+TG
	doPGHM0EUv8XN0YL6lHHby43niLrL4aHCoBOZZjgEZZCLxkZuedteC6ncbZMuXOB7JKmj
X-Gm-Gg: AYBFou09IlpSqs50nInwxJwhl18ImVkBHOeZ8FOybCShxs2VqJzG6T93jbOp8PgwqqS
	DrmWWhVPgLdDfehA9oA5QYG66HvQoRiwwgr/eJGtEuaawE9i2k5f7KY2D67iVFKMgWMLV5Gmmi0
	9p+89EVXP/YgK/OOwoj3m7lqJsQ9wXIieOKH9pEu8QjOQHdZjsFlNE4UK+1OGwFDgO60h+Uv0nG
	b9Oq0sGkbGK13legFHWisnWw78geAekwJbPFzwVb6rcb0R6L+Ovll6NB99Gwa4t0JsVDCRHMKSo
	sjJPNLipN7P8ilTovZHDrRuxOmh6n4V8yLAbgFaGAZfsLDlktiG8OQhUIWsMeUDI9IOQRR1vu48
	CxRR49oUKMtE0UZYmSlLWqnfQCXdTHTdwj5sHfdOoivYY
X-Received: by 2002:a05:6a20:7f8a:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3dd8c3fd41cmr16576693637.4.1789982078292;
        Mon, 21 Sep 2026 02:14:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:7f8a:b0:3bf:6222:2e7e with SMTP id adf61e73a8af0-3dd8c3fd41cmr16576663637.4.1789982077898;
        Mon, 21 Sep 2026 02:14:37 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c342b3c67sm18923840eec.10.2026.09.21.02.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:14:37 -0700 (PDT)
Message-ID: <321460f8-f24a-4e91-be17-50f1639f8e76@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:44:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] PCI: qcom: Move PHY init and add PHY reset call to
 align with HPG
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
References: <20260915-align_pcie_init_sequence_0916-v1-0-0b2195836f30@oss.qualcomm.com>
 <20260915-align_pcie_init_sequence_0916-v1-1-0b2195836f30@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260915-align_pcie_init_sequence_0916-v1-1-0b2195836f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfX4VN3gBqRizPc
 buw49bofljWWwv29pYhLvcRipzrNEqkX16eB9Pj5jFh82CbgAvE8LydWSBQWj0lsrhfbrJ2RUQr
 0fDrV06KQXMnhSkuo16/P+JnHHlUPOE=
X-Authority-Analysis: v=2.4 cv=AsR7T+9P c=1 sm=1 tr=0 ts=6ab0f57f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WcHuybdFNItx7B-R-rUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: wwLm_ahE_IUWwOmdQTzorLZa0wvMEyLW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMSBTYWx0ZWRfXxqNWWKNCmzBe
 tV8Ms19xpx8x8ai6gTazXMa6IY/Ry6stlv/pYGnom7n0TYquUVjri4YM2ZS912cG53tw+M6KlIB
 diQRys08IvYx/QqtMASEHmFjmTHDv52qRuOVvZ7+sA5Gy3VeH/fExECP98EnlF3hCNZddEnMHFs
 1/CSCuaydmmzKMkEx5nJUdELxAU/2RQruX5NPxS40FSo/7Mhdm7pIuXxb/oB0Xi1Heof92F9iyY
 /pCLMAOjDyLysnY22Xpxh2rvSB8ZoQWs5qx0Fe8Um5W9zDf8Tmol81grKo8DLGmvtd3EPvlvryw
 5gi4ytQfqRabVhxqe3MiqjP4mjK2EJ76QEJhqCIEH4jRG+OfauHzGxJz9V85R/DUPzUKlJS6oNd
 qpYxG32xqHgyygUMEVcJCumuuEGUV2K3rW6D2AKpPQyo551qAbmHRrxVEdDUa4mGZmKdvsodMVh
 z57QaOxVcBR5tvU/pkQ==
X-Proofpoint-ORIG-GUID: wwLm_ahE_IUWwOmdQTzorLZa0wvMEyLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210131


On 9/16/2026 11:34 AM, Qiang Yu wrote:
> HPG requires the controller/PHY GDSCs powered up and all controller/PHY
> clocks enabled first, then the controller's reset and the PHY's reset
> toggled together as a group, PARF_DEVICE_TYPE set right after, and the
> rest of the PARF/DBI config left until the PHY is ready.
>
> Make use of phy_init() and phy_reset(), and change the call flow to:
>
>    qcom_pcie_host_init():
>      phy_init()             (PHY GDSCs/regulators/clocks up)
>      qcom_pcie_ops::init:
>        enable controller clocks
>        assert controller reset
>        phy_reset()           (toggle the PHY's own reset)
>        deassert controller reset
>        write PARF_DEVICE_TYPE
>      phy_power_on()
>      qcom_pcie_ops::post_init  (rest of the PHY/PARF/DBI setup)
>
> phy_init() moves into qcom_pcie_host_init() and phy_exit() into
> qcom_pcie_host_deinit(), right before and right after they call
> qcom_pcie_ops::init/qcom_pcie_ops::deinit.
>
> Apply this to qcom_pcie_init_2_7_0()/_2_9_0()/_2_3_2()/_2_3_3().
> qcom_pcie_init_2_3_3() was enabling clocks after the reset deassert; move
> that ahead of the reset assert to match the same ordering. Also add or
> move the PARF_DEVICE_TYPE write to right after the reset group in each of
> those four functions.
>
> For most platforms phy_init()/phy_exit()/phy_reset() are no-ops against
> their phy_ops, so moving the calls around has no effect yet; the PHY's
> clocks/reset actually start being driven this way once a later PHY driver
> change implements phy_ops::init/phy_ops::exit/phy_ops::reset.
> phy-qcom-pcie2.c does implement phy_init()/phy_exit(), but moving the call
> site into qcom_pcie_host_init()/qcom_pcie_host_deinit() keeps them at the
> same point relative to that platform's own clock/reset programming, so its
> init sequence doesn't change either.
>
> Signed-off-by: Qiang Yu<qiang.yu@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/pcie-qcom.c | 165 +++++++++++++++++++++++++--------
>   1 file changed, 126 insertions(+), 39 deletions(-)

Verified the PCIe enumeration in IPQ9574 and IPQ5424 and it works fine. So,

Tested-by: Kathiravan Thirumoorthy 
<kathiravan.thirumoorthy@oss.qualcomm.com> #IPQ9574-RDP433, IPQ5424-RDP466

