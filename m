Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794920637;
	b=KF/3k+M7eceFB+Pzn6OZ5Vug7EIiXGvhz3N9DhrXcAM9tkBMJWc4SVY08F7ZAgUrvIHV
	 i1QOacedwv/0oOAFQ2ILsIs6NGkS8s/IdAuZDQmWTBnkudaSXFhuWvHmwWNCyvIigRM6F
	 X7rBjzDwnOhqQw4AXU9KaO4wqzGcIW7Rb3ErfiNRuoB08hiGZxQyTWc/IR7SYqRKaVFxD
	 /qe51Y3s/G0lq1HC81Vtkjb/1Mfq1kVtWoaXmJA1ZqLIeKxEXreBfrcYbrYIIP7TXObXj
	 MM0eoXVFURFqMtwliJ9u0xpQGIzO8a4kznF/KdFNyjU9O34IHWj/gDvWZ4am0nUvJwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
	b=rKffFOpnDQ5Fa8Xc6tRjBs+UAeLcIOZ1OeR/38/tSQlq/8Dj1+0Q1UiLxaRvfowLIwhD
	 kpYmaoOjUw2lVjIVqUa7Mwthn2j5/FyGaVvLPNYPR9qKbjv8bNcce3sv5GNCAbkYUUKdW
	 3anmb1LSpbicU/rzj3dnqgr/WVzmhAgdglh24iNIpRq1Ajd/Yp6EDm7D9ubaFCuQEle7n
	 seosVSgQXPNJdJwyig3dbD4fzPven4GPCYzfH6aB7e/jOJX5O/sdb8fijPaQCRodtC3R4
	 /0BAlqW5fjg46/7YrTUsrTaYrwfevH68M1+crOZayF3JMSDz3Yi97scQL/QTfTGv3dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrclhhdD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EFA606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54EFA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z708Ontx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DrclhhdD
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC1KhK541644
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=; b=Z708OntxTIeiu5xP
	JQo/syo6ixFFvp8O3tcgIJXCVoAahWzRbhduZ6QukD3Sv+2dkDVsH9UfB4svY0Bx
	L73an1q7vj0+lMSePFWRnhmoked7pOlnlSJJr16JHnOu76wKAh0nQwbOWGdc4jBS
	uq3/J0CcnDOdS2ALTsDBRhUd7R5CTh83GnKnJk3uZ1qX9jDYNwGFxZRcZXZv9jsP
	ggifrH4bpm74JcFXLkws1clbpYBzuRHCWiVGNwisBr7dS2y/SGRh8grvg/HFooms
	IH+1gnIyc5ZryvMgtXimfK1+ElT/MV5etM9x6NIpgPSCUUuUlCv7vMEho3T3tGIl
	ZYBYlg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd1gm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 13:03:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso427271285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 05:03:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794920635; cv=none;
        d=google.com; s=arc-20260327;
        b=FGz1hyB8VdWQwM5biep9qPsWYXG5aP1ZmCUHUQhSfui8KlSTNvZdaTFe63ggl1K2RS
         +RGW09oc9QUqJCj7S7B1b8X02q03IPihE34cTh4kjKZUtGfdWaU6ZE9qFnu2JLI9fMb1
         7PrLLnVmHnb8vRG9kXacex9Woi7JIfjOYJtu+TEdUnz0Z9e5NuZ/1JPijXdQZpE83dae
         lL3OWsxn2AF6FTokS2de6aU9MWwUs/sY1YA+ssUKu0V6Tmdi+89m7xO8DjinOHT+nOdo
         oWUSKfcumokJSMbkK9eoEmcKfUAWFPOv2fKNvz7NtIr+iFj0GMUuyNZdA+xBw4KPoAg1
         jGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        fh=CtoOfh/tTGJLP0jZdvP3A22omkRWSX7FQH1LZUkAUjo=;
        b=d+++EdWxsN7vhsPo0/Gq5/vHChZk3YAB3EoUg/U1FhMpDUoATYgPolzM2CxD/kyDu9
         zENM/n0R1iDl/r4kTFIIEeRojqFoNTCFpAfO1xUV/W2/XcycjrFRQOrQcdS0sXoGi6Iu
         QZZgTDsw287DgtoegPpq5Z0PpvrLEciPa6ORIpD/LXwTCYf4MpUA3P0jzjn0A30TWQHu
         MfZts+2XN8dfg5p9uH47FMzWHpNU29Cu2qCXlBxUaFMq0/9QZLs+Dv9A0R7H7CkDtg5l
         71MGR5q2TmSgIbCT0KrHCUFK134ju3E9b+P7s8brbEA9tkWD9Jhj/uYSzactoSu64F6R
         jZwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794920635; x=1795525435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=DrclhhdDSKo5bfDRMkPipF0VnlKtUvt3Ak1Ubqp/nFTmnosbCLodnTYMpLfnitfinv
         8hiTJ/FNr+jWE2XdfAuAt7Ds95toPBIqk1m0aW3VqU/mPbGmPAEX0n+34AWR/gLiGivJ
         Tu7ARACpHUPBdqmrHZrnSiHoQi+RmYeJIR6xWCKaWmk7/Itaf40tUW9ah4exW4qN+4Bs
         XzfpX4pXxEM+NHETSlZLawLhOT499pHJhTTPN7u2E+YPsGIFZwd/UuOgjwrwgRXIJLIC
         wPUHq9rgPyQQloQgHUFkn/oKuYVSFQ1P4JJdOBG/dTECNxmEDYyEFf9Ocbpi7Sx98zQm
         iMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794920635; x=1795525435;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1z0nrgeiBBl57QVoEdYEq+j3cNVCObSWB8q/eNPs5nY=;
        b=S1SAuUBRxKCrcAUNscaFbp6YJQP1Y7unc/XKu1lkus1EpXalhCmeKLqKo9sdceND/O
         iQw46AhofjWfHFCMpBz6xNfLAw4/aZnkXursMPBjLLs1RzZGRQP2fjiHVnKrVqqRBwmP
         nV7Iacvq4daHfpTrheMR+OplRSmzXIFPvB9Ntc8I1keoq7iH8x2PrapXnIkheiL2xVJb
         jLI0M5ZP0QQ71iNMTxkm4fDkL1iOgrkdz73I6hJyorCp7AVb68dhJ/RKIWEAe1H9xJy1
         udkqo5aFmlinVU6xsEmbCBjxvR8HVYLjwN+czHVTmtCfzZWU9mhxfYPpIMLUV+ROv6D3
         r43A==
X-Forwarded-Encrypted: i=1; AL+hErGUNqlWftWJ2uGIgDfB3FviOo4Nv8va3GyEwUYzkWVkgsM4A0r1Jxi90uAPmYpCkux4vgtTJaiOAg92+zTC@vger.kernel.org
X-Gm-Message-State: APuU4Z9w6bBaT3ZHmYi7xezt81XF2q800I1E31CYbdVRNbEFBjS7RA6S
	vPiD3EaorLG0MUyrO6H8jOozapUx4xOaj080fkMcAwsqewaWPDPSPLZH2uo8xtFxTtC3fKcI1kx
	5aKZGk5eWhxl0HGjEmE/Ig2AnykAZLDvxdG9qvgUAxK3hwpbog4NXvzJfycb9ZlJsnT8VrajAtb
	nhB6dylX28v1TklMMhTv8FCo5+opr1s7Hxxp5JUArxtu4=
X-Gm-Gg: AYBFou3yXfXXn79UyD6Za62wTvWMdOo/+nsv4S0u/HhafeY5f9rCUGW3dAmKSGBnD/J
	vzP7nlClMWXV+DOhBK13Zdu5wzEKYSXzBEGPrfhI5++gvWIdveG4ichlBrlDRyNv333WW0IB2qo
	vtchiA380CbdKojQ7+INTHAd+EMLzhKwhsDAJdVrA1qRmm3zG9QsfU9nMDECNjFXv86qo725GxR
	DkJIb9K2v6NiJwqYmeqhKyaaFfCjOy+8eAHxN2FbcZv7Yc/A4GZg+b4DHN+JSbcxzoSsiHiu9ID
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id af79cd13be357-9494bd03e56mr1975575185a.76.1794920634741;
        Tue, 17 Nov 2026 05:03:54 -0800 (PST)
X-Received: by 2002:a05:620a:27c1:b0:93e:c12c:9b71 with SMTP id
 af79cd13be357-9494bd03e56mr1975567585a.76.1794920633951; Tue, 17 Nov 2026
 05:03:53 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794905977.git.zwq2226404116@163.com> <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
In-Reply-To: <7a9617af129fac54b3a2575e39a006c57854142e.1794905977.git.zwq2226404116@163.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:03:43 +0100
X-Gm-Features: AclHuK_HDpVH5z01rUZMFuJfiVt58vAHMQBA7hfg6V5RM69JEn4q2DTIa3B2MKM
Message-ID: <CAFEp6-3qmEu7CToPu6A9=DeVRSfTF0qmw2Ki+CYmJ4gvpzOVWw@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] bus: mhi: pci_generic: add Rolling Wireless
 RW135R-GL and RW151 support
To: Wanquan Zhong <zwq2226404116@163.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc50bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=Byx-y9mGAAAA:8 a=1peLKHpgovxI-enXKA0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfX+nDp96teR4Y8
 iD5BKBB2eKzEcgCqJy+HkapEpv+JSHc8iOZns11RnmGPZ1modq+avrayzGVTIKMaAqahoXxMP+R
 egnnT+7YQOlRKDS8LC4OTkL1dYNUm44=
X-Proofpoint-GUID: Yx2gyc5VxtknG0Fai6y5kKMUppwxGp7e
X-Proofpoint-ORIG-GUID: Yx2gyc5VxtknG0Fai6y5kKMUppwxGp7e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1MSBTYWx0ZWRfXzrnx4jouoQ6H
 3NOw6Ec43iKbQJXNds9B936AFgEh63uMtaWtlMWsv+BZgIU7r5uF52N1kf1yGAZ3lxhej1cQMnr
 XwhplDxXv1u8nCQQNlo3zi9dKcarwFHn1A9275zd/mps7fTDgdJbxC0CsCFyuRa31XGr1Z6YQ4C
 j0cdN/sAxLVpK0yADEz35xXEZ1mAK43eeU5bP4EAXzWsYDDrMkiJsCk8DVlPlmWFJ4qYtibkY4Q
 GAzyqe+z0NqgwcawfzJ5VTkxfRIXLPVmbi99TYPI8B5rjvgbQg1egWhTUPJxBIXvks1VYYR72Bf
 wlN6Yrkk9rOMf2esXctsoxPn1w0Bb6Kl58IBngGENsZx0Z7d5Hu554AYCGZlwPQTJiWGtZTT+gj
 tmTycSDrphuDOLnxDac6scT29Lo/VFjFiKowtk946KUTMQx+sDV1YievGyQxeMjq/s3zITmHSNu
 P575srYNw75Kc6k9TDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170051

On Tue, Nov 17, 2026 at 10:14=E2=80=AFAM Wanquan Zhong <zwq2226404116@163.c=
om> wrote:
>
> Add MHI PCIe device configuration for Rolling Wireless modules:
>
> - RW135R-GL (Qualcomm sdx35): SAHARA, DIAG, MBIM, DUN, FIREHOSE, ADB,
>   NMEA and IP_HW0
> - RW151 (Qualcomm sdx75): MBIM-based config for most SKUs
> - RW151 SP (2099:1502): QMI on channels 14/15 instead of MBIM
>
> Register PCI_DEVICE_SUB entries per chipset:
>
> - RW135R-GL on QCOM 0x011a (sdx35): sub-vendor 0x2099, sub-device
>   0x1300/0x1301
> - RW151 on QCOM 0x0309 (sdx75): sub-vendor 0x2099, sub-device
>   0x1500/0x1501/0x1502; HP OEM sub-vendor 0x103c, sub-device
>   0x8fb8/0x8fb4
>
> Use Rolling-specific EDL firmware paths under qcom/sdx35/rolling/ and
> qcom/sdx75/rolling/.
>
> Tested suspend-to-RAM (mem) on Rolling RW135R-GL and RW151 hardware: MHI
> resumes cleanly and MBIM/wwan function after wake. Hibernate (disk) could
> not be tested on this platform (/sys/power/state lacks "disk", ENODEV).
>
> Tested-on: Rolling RW135R-GL hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
> Tested-on: Rolling RW151 hardware (MHI probe, MBIM, DIAG, ADB,
> suspend-to-RAM)
>
> Signed-off-by: Wanquan Zhong <zwq2226404116@163.com>
> ---
> Changes in v7:
> - Standalone series on mhi-next (v6 not merged); includes full v6 content
> - Add mhi_rolling_rw151_sp_* for 2099:1502 (QMI instead of MBIM)
>
> Changes in v6:
> - Full RW135R/RW151 channel config and PCI IDs; no_m3 dropped; MBIM ring =
32
>
>  drivers/bus/mhi/host/pci_generic.c | 152 +++++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pc=
i_generic.c
> index b636e2c23b4d..ce9a1205c2e9 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -948,6 +948,137 @@ static const struct mhi_pci_dev_info mhi_netprisma_=
fcun69_info =3D {
>         .sideband_wake =3D true,
>  };
>
> +static const struct mhi_channel_config mhi_rolling_rw135r_channels[] =3D=
 {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw135r_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw135r_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw135r_channels),
> +       .ch_cfg =3D mhi_rolling_rw135r_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw135r_events),
> +       .event_cfg =3D mhi_rolling_rw135r_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw135r_info =3D {
> +       .name =3D "rolling-rw135r",
> +       .edl =3D "qcom/sdx35/rolling/prog_firehose_ddr.elf",
> +       .config =3D &modem_rolling_rw135r_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_channel_config mhi_rolling_rw151_channels[] =3D =
{
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};

mhi_rolling_rw135r_channels[] and mhi_rolling_rw151_channels[] are
identical? why duplicating them? same for event configs.

> +
> +static const struct mhi_channel_config mhi_rolling_rw151_sp_channels[] =
=3D {
> +       MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
> +       MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(36, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(37, "ADB", 32, 0),
> +       MHI_CHANNEL_CONFIG_UL(60, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_DL(61, "NMEA", 32, 0),
> +       MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
> +       MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
> +};
> +
> +static struct mhi_event_config mhi_rolling_rw151_events[] =3D {
> +       MHI_EVENT_CONFIG_CTRL(0, 128),
> +       MHI_EVENT_CONFIG_DATA(1, 128),
> +       MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
> +       MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101),
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_config =3D=
 {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_controller_config modem_rolling_rw151_sp_config =
=3D {
> +       .max_channels =3D 128,
> +       .timeout_ms =3D 8000,
> +       .num_channels =3D ARRAY_SIZE(mhi_rolling_rw151_sp_channels),
> +       .ch_cfg =3D mhi_rolling_rw151_sp_channels,
> +       .num_events =3D ARRAY_SIZE(mhi_rolling_rw151_events),
> +       .event_cfg =3D mhi_rolling_rw151_events,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
> +static const struct mhi_pci_dev_info mhi_rolling_rw151_sp_info =3D {
> +       .name =3D "rolling-rw151",
> +       .edl =3D "qcom/sdx75/rolling/prog_firehose_lite.elf",
> +       .config =3D &modem_rolling_rw151_sp_config,
> +       .bar_num =3D MHI_PCI_DEFAULT_BAR_NUM,
> +       .dma_data_width =3D 32,
> +       .mru_default =3D 32768,
> +       .sideband_wake =3D false,
> +       .edl_trigger =3D true,
> +};
> +
>  /* Keep the list sorted based on the PID. New VID should be added as the=
 last entry */
>  static const struct pci_device_id mhi_pci_id_table[] =3D {
>         {PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0116),
> @@ -961,6 +1092,12 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE912C04 (sdx35) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x1c5d, 0x2045),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe912c04_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1300),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
> +       /* Rolling RW135R-GL (sdx35) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x011a, 0x2099, 0x1301),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw135r_inf=
o },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x011a),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx35_info },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
> @@ -995,6 +1132,21 @@ static const struct pci_device_id mhi_pci_id_table[=
] =3D {
>         /* Telit FE990B40 (sdx72) */
>         { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x1c5d, 0x2025),
>                 .driver_data =3D (kernel_ulong_t) &mhi_telit_fe990b40_inf=
o },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1500),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1501),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x2099, 0x1502),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_sp_i=
nfo },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb8),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
> +       /* Rolling RW151 (sdx75) */
> +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0309, 0x103c, 0x8fb4),
> +               .driver_data =3D (kernel_ulong_t) &mhi_rolling_rw151_info=
 },
>         { PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0309),
>                 .driver_data =3D (kernel_ulong_t) &mhi_qcom_sdx75_info },
>         /* QDU100, x100-DU */
> --
> 2.53.0
>
