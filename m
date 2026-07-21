Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5AC47D928
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629420; cv=pass; b=BQTd1UaD4d4+fZL4NPJLookw6zlWaS7RXuuuATE1OrnKQAPHDvoeRnrvWnNoH3TERZBhpJRykxHqPv63cB6bvlJfb5U8qKOogJG3e8vlrNn10YZpA01lWdR557mcyDl0ckBalzBIKaDbwi5wQp2UaqmUER1iFkREVMjj2OBvvk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629420; c=relaxed/simple;
	bh=dAg65rfGUktkEyRGS6LHi1HlhBVqv2aq5WVTQI9cBnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVFuSIpP5oCZliseBZnslSZMnlBgPZIlbJ6zySGIipevteCDaEficJJLwvm/NSo+cMbFwAEmrTDk4w8HKxmd+b21D3GYBF4r3XolomrPiuebvZVoL5IEV8GdjQ8C9hucr75GYK51frvhjAJNoEEB6vGiZHI2LcoDjSDfh1ymCfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkZU9qx6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+9NFGkQ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkZU9qx6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+9NFGkQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L8vkke526963
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=; b=YkZU9qx6lnMX4N5K
	Do0b62EpRlotw+/e8mEbhWDllZ3QfTEvVcxyBwNAymMa+RQMcZQyFEuQy7fXxd9Z
	rWH4cWFfbPEGE74FlVO+pJA4iZDM+btPk9jltI5eWsv1UAL6mEo05qZHc0IR+y0z
	RJsUEtKoGNdiMaoLigiqBrxnJsAIW/jkcyEcEb2/Ff2hxrfXhIsfC3c5NR0SSa5G
	7y0HXEdC1VzjBR0o4gRORznyxuibrXiiQ2YD0U1oyc1mN4nSgSvfjlan7Iy2q5or
	tQ7kd/Y3Ni1XNudl9Rhgf4CDLVN9VCLP+AO3YviOI66wsozf3nEO/8J4yKJpE4ju
	0TPZmQ==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1se1jy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:23:37 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e71be771cso79841547b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:23:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784629416; cv=none;
        d=google.com; s=arc-20260327;
        b=IykP7ooDTDrEjsL8QyfTI/Og+xPUH4ghouU235k1VT+eH9iisD8dZIW0ZYvbwGgaps
         0PjC5wK/ybji+/F3/5cV7TfJBMztRkow6+ZELa8jue6sFkIj8AUQNEdwxvioeMl2hNpp
         EwUnQLhyQc7GxRwOdVdZbh9P1FQkt3+gQE+VAcc5sSYYY3cKHTR7LsJX4A5X944DMHSY
         5XshatA756iEWF22rVKp1JpZpC2kmpzaEY3kCX76tk+WDwPxzhf0ZGk7kuiRK1nMHRq3
         h1aFEHPYghg3oLplYAC3JNNrB6vMEdAWfCWkf/Eg+15YRwEqCTb11NKe6tWlC8ypZ2eC
         wkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        fh=VYTfVYIRDjcOZRb9ISG7Ejp0pwDP+bjP0FMHZgoicfk=;
        b=m591Y73h0b9fRr2gRe5Kd6rGJ6FlEtgg85suiSUErxMQEEpPYHI8obPcNrHWvcC9OT
         VQtKb83c72OYmFEB5MavWOb20koTvkoZa+1ZIFwaDTKjxPNGcctLV4DkOXS+nDnFC98x
         UrhJ286EGCF9cNt7mxPufrH96TfxzNaUPwk4WB1Y5e6DokpT8Ep0Yiv3+9YohpTETzFC
         ukyVVCNEWMj4gcF/M5aJ111efkTnOCUFCW1hOwW+7k4BJTSxtk2bneqX8jWwrky7IoJ+
         oYwL+6AnAspg4p/OA6SQzTeOJA6mMLTTsAk37enNOITE9XlrsVEul45xSG9dY/r+4LQN
         MYYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784629416; x=1785234216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=a+9NFGkQzqDbR4UJTTXL2nX41AQ2LKh+fb3qfJ7xzTcCnZBzuEjZKlsriGLROVw9pm
         02K8x1LR1Kg/31neA5TeGFddMhUCGGESNaKaTpwEYcNIZUqb8WV7R768NJmbeatVgpyX
         A36Dv5177kb3gGouuGkOGq9ztgb016vjqB6ihO+sd1TpinEOrexUaBQOBAUJmmfryxgT
         DsA5d9MmKIsZ2TbkM8/rY5Ugmn6dJm7rauTie/S618CWKYy5dZRCVgo8ITUA63G0dnZg
         CA7OnLAzpDL6Q4zGNcEaRacNRhQef73krPY+Djj3ta8RRnfdWv0UCqxMZY2395o2lRjA
         VLIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629416; x=1785234216;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FNVZLfwCsaGZu+dN7KdgMrqhUKre/8+4rzOhShj+rOc=;
        b=jnxwsE+NWKV3xcInLnhaE4hqUCStfFkBpNOKKA+ohG4TvRPUHB91DO+x2kUFyeMU1n
         +/KUKeo/3Li+qEpytNybzj5boQBlJWzI5Vqn3L2YgA4rwz3FMrjcrKLJYOtiidTCId0S
         pbMe0Ehj4LWZBoc/8XSJLTEWVPnX2nEx4faf+QGukCl5GkIxmhHyzXYTmp1ZZqmPc/wl
         uQ2sBrriU8t/heNyXtOaQpTXLPw7iY1ckCP5sxCNOukfv9xKcD+bbmqpcAOymIJHwP6T
         jnpkXalDVDyQq24M96EHT033c5vyzfUAbrRUyAD+Unl8PJ3fWScxM8yAifkfxBoXR+Xn
         9Jhg==
X-Forwarded-Encrypted: i=1; AHgh+RruayfAvfxukixAmvho5ZEs6BrOK5xTZJ/SmddKcexoymoa44JFDbTDibU9946f8DipBVecgDNyK3JAFBOO@vger.kernel.org
X-Gm-Message-State: AOJu0YxTlCWCQ/wmDWVbEql0DttB4S5fvFs186OvRVw//E7LLdj4/odz
	SfKPSPow+6stzpCP0egPC22C6dHqDR8nNx7E+ieVt6OXT7kU1MJYebZqgfuKSIVk6VQ1fkD133R
	4d/x55PQRjE+yq8641RVJVgPyd/aaIK8s1GjLII6agC0sLnTt2LfcljTOOlBnamUX0QR7L/MQp0
	1rI+lELDvYQ/xyKs4fiCDnFylORvGhBOp59lszi1Ry38c=
X-Gm-Gg: AR+sD117/rxCUlgEvWjokRSzKVZrTc6PA9CQ0A7GmodqdItwD/rd3R1zhgZjm8tZVgp
	7c9EI05/I9SzGI5vdTnDvCak2fLYxSzkVX2HApUnxN/FDWRXUBJofTtvc3qltphsz5aUo/V8x1p
	jhpvOSbl3CjW6BlzWk9KVDJmvzfW1pI8phNK1dZgNUljTDGfkS1Iv6jArPaw==
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id 956f58d0204a3-66885e80a8fmr310968d50.38.1784629416537;
        Tue, 21 Jul 2026 03:23:36 -0700 (PDT)
X-Received: by 2002:a05:690e:148e:b0:668:85e8:7cb with SMTP id
 956f58d0204a3-66885e80a8fmr310932d50.38.1784629416151; Tue, 21 Jul 2026
 03:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-10-sumit.garg@kernel.org> <alJpc3nFX9D7_8i1@baldur>
In-Reply-To: <alJpc3nFX9D7_8i1@baldur>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:53:25 +0530
X-Gm-Features: AUfX_my8FmFS_RPsD9P_wAO_xi3w3rSS9J18xqmBVD6VnuXnMyKuUdz39cXSwBQ
Message-ID: <CAGptzHP8EQyvx3tn-ZVWZPN6TwFec-ADvAuxEQhwQBE00Sg=Kw@mail.gmail.com>
Subject: Re: [PATCH v9 09/14] media: qcom: Switch to generic PAS TZ APIs
To: bod@kernel.org, mchehab@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jenswi@kernel.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: AMI92LBS0S5mT4NtS3K9aVEhcVsDy7lm
X-Authority-Analysis: v=2.4 cv=TIZ1jVla c=1 sm=1 tr=0 ts=6a5f48a9 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lt5aTsHmsBbDyw7JONsA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX3WYAqEv488ze
 NOUIogosXKDzDCEx+YAwfA+sKTGB5vgtKlQK3OE6w1X4on7JDNEQRui6LCgPZlAKsmAatLO3Bow
 5uYOFucHynom5jO20hUQPXPp1JI/n18=
X-Proofpoint-GUID: AMI92LBS0S5mT4NtS3K9aVEhcVsDy7lm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDExMCBTYWx0ZWRfX1el6vNpn95Mr
 DCPiGuE3QMFSQaxwELson6g6LvOZbe4RMl1qUhwHlNeu67+2pMaHqyo3RYYTTzyIF9Z0zzbUX/C
 xEGfb4RwhDO9n3lvKVRJ+U2YJgW6HexkfKKjxB32+vgNKZJ29yXcidYyNHMu3T45823GqGJ1z/w
 BbI2jyJw5Eo/bJBKpXHZPf1Z/ufl+7qOwvHRJIEcp23dX8qdenKLeUbPJQ8GGJz9KAzGonV0B8b
 c1bxL5P4BvQH8d1jz3KAAzt5dw3t9/UN5mpdyoVuogPLGdZ8B5W4r6FUxZpthEruO0bXvX02Ch3
 TCzDXY4b9tDaESYcPCnNPEI6hWoVuPMGbTF0xpmIIndd1rmpP0xFOcoZg99Okzf+REecoog4QL+
 B6Ue/jH++Pof+lmvTeU/eJ4B5bfwOKQf8qvE9w8+zjKFcv4mKNiPnv4iu9Izcopf4Jui2jjDbAZ
 wUo2XpNI+M4NNVmugdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210110

Hi Bryan, Mauro,

On Sat, Jul 11, 2026 at 9:36=E2=80=AFPM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Thu, Jul 02, 2026 at 05:28:25PM +0530, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > Switch qcom media client drivers over to generic PAS TZ APIs. Generic P=
AS
> > TZ service allows to support multiple TZ implementation backends like Q=
TEE
> > based SCM PAS service, OP-TEE based PAS service and any further future =
TZ
> > backend service.
> >
>
> Please find an immutable branch with the dependencies for this patch at:
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git 20260702=
115835.167602-2-sumit.garg@kernel.org
>
> Alternatively, if you think there will be no conflicting patches in the
> time leading up to next merge window provide an Ack and I can pick this
> through the qcom tree.

Just a gentle reminder for this patch to be picked up as only the Qcom
media client is left in the next branch for migration to the generic
PAS layer.

If there aren't any conflicts then please allow Bjorn to pick this
patch since the cleanup patch dropping the old SCM APIs is blocked on
this.

-Sumit

>
> Thanks,
> Bjorn
>
> > Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
