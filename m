Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794216958;
	b=If95jBoX6riViJWHvVs8I/KYPVLjqNvexhvt03BBFewTmeJKpg4+s5ddv1Onkm4IgCZx
	 l62KEBE1PmVMOi8vAy7Vzo2dk7gIoC0kWZOZEI7kwWdnDeIfLW/8f4dF6YUQ40c6kUNUx
	 Kt2vXjJnlUr3d+fuYpdaVKwoSytxSgTT8eCG1AEXwjavACJlZbjnuOUmumDq26dpZC6i2
	 XRLAxCa1ziBDMGC3w3vXTo+9zZ0TMYHjGF4baZOBnq5jZx1EXpiX2DjcKX8pbtQVdW2nR
	 g/hUw9WRHjeLrl54clq/ApXNi+cFLVkqAWBMay5lp4ZlPCw/xUyYGiROWG52nw9najA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216958;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
	b=1KOXiu+kRmUSlhMU82hAnywkQsFssTjNYT/fm9lqExuZhEDDMI6lbVpOyf6Pd4Hc4KS7
	 TDyKk/boeYqdZ+1g24rLRFPrMDe0W6HTHmSA5HntQuY//R32Zgb5X2vZHHeCjCOvKmphv
	 q9Ei6Zjiz6RsBZeLD+/1KK+di1pCWPG2/EhHXeMPcGlvx+0G7rzHu0HvjhosJLXP5FrZ6
	 3IiIUJU+yzyYcaUpU0wp/rlDS/c4g6hPYRyxIg8YQVrBDoxRRXwiNmPmIFBIeZcfkcEUu
	 yeUVUbw2fcTOMspEWUvznDDR9LzWg08LYoOAxg/qQV2H+L8PZ1MZvADxixvcvtdHP7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE8C606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 09:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EE8C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k59Rh23j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dkgMrfzk
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969vbt3580920
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 09:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=; b=k59Rh23j1+/mJ9Iz
	Q/lSh/AFKzplHqzHWeTReZ/CAiPKqq0uTUQKjsY9kcQja5Np1X0FwurOR/v9SGHn
	NlhtUAAJsrhBc3RgyJ+KY9aEIes4/h4vW5hUB44tt5Ak1VvPT1DAWYS4E7td+hnL
	mXQAbNn1qufc5SuHtVT5vXxzm00jz3l1S9trDw7ix/lndzSb7XN0ne8BxYstlJSo
	eiEvS/EMRYadWnRFTBKtZvKZm/ICNzaEekUdxeQwfd9YKTs7Yf23CuFF8sPDVeZc
	CUYqrDznXhnubQ/kFmucDz+gjFYspnQvAUlWMsTn99jfZ6xOB5pkh2jGhlXhUAmH
	7wU/Rg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735mk2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 09:35:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso137624985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 01:35:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794216956; cv=none;
        d=google.com; s=arc-20260327;
        b=pESZb6XB2j+T4EMhq4Xw+sXjiJhZPnw3lK9OvU6O172guxfITeFga02DjYFndPXynx
         rttK3/+gJY7nZp6HsakLPDWFbQhe2p/TMDox9jglFWmdoq95dwpVWorr+d7hNKfdgZyX
         1VZSTDPisNEv7oLBRj7wZLIH+ewxqgcCvZkxY2r0XFJ7/RMjZKo+UM8sbq/QrfyRQC4h
         Bkcal1px5KoK/Umxixqcxm04E6mXAtGw8eQamfJX1F5DzwB7zeGhOYMMgLvIDHg09OiZ
         TSS4aULxxoFbbnSO2dkRBUmguR2AxdpAgqTurWvDrgLIl1Q36C1gy5Yi/CfmcBCpGn3Q
         Dy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        fh=sp5D+gW+O95VK0y0OXFnOOJCpwEsukqP0CXdS0fnjFk=;
        b=KjYh2sCdqYeBnGSfZ5g7hKh3svMufhdikqqwPsAP3f8CqxIgSzGlFKrUkO0SNp96WZ
         c0mKJ/Da62+Ipm4JrLWMzOIL7HDFTHOSQ3EEaK1ETi80Rdau32b4YAjikHwgw1q22HIy
         /DIS4G4tdtoOImU99m7EjCCtt+XFL8rdKAr0guYrdAoj5oEpjRArtdCGi5maJZ1qq2Fu
         JCZLkv9L72TonsUClSGjKSFihYG7OvJRyc9hU53dntlVa4PuEx+F0Cl+aXDV/7z+84fc
         3gWVTNBLodLGR4fFDxspfughrdLEYMgVCOhVscbr+K3K7LhPR4Tbt5Z0oM1THwrs14Ft
         hZYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216956; x=1794821756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=dkgMrfzk/OeSKfPGyF0nkbZlsCBZY/4M+o2Rq5l/N1k5FcWldWJpDaOE9GhCMldOJO
         Qoosjgag6Ivm/1WuSs+zo2Bk9beQsfiv0tS1kcHVtLiM3DjBZyx2OaUDaBONRBAYCmBk
         aMe1DcyQ8IsCOl2o8HdLfZpBHaAPeroqiyuIH3jyADxcjfgk5ec8eKB0mYUCGUGixDYC
         VdH7OGHIQJADJUBt0TfHZ6Ju3HgktXMQICNyVyxOhRHhOsrhUTf782zw6yHV6xLwT4/L
         u5q8A4ELCR/Xnr//HA4ZZSdxyJOGNmWmlxBtOTB7YUpdFLJsjkhcF6rdzuB40GgvhwL8
         a68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216956; x=1794821756;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbeM8g8zqHzgMBSkaZOk8eKUdUcdQmlNvh1nMX8yoaE=;
        b=org4fwxQA6CS/Y7FwCC5sh/WtN96qytQxWtwI/355NoV62e3AN5n5T+1YDyTUEuQ1s
         mXYBGPdR74O1d9iyCqz7L7YcPaF5QuhAIRA1lP2aM5oTU/6RugbOwaDtDBas0qXWCN8s
         EUj9SQ4iMl0Q28KtyRT3DUXiGn8tYQp05H0ez30uf8sxNHVyOhfcqxg34mVQ+31FS8he
         3xgYJo+e9oj5uAFOqHBRwYt2MV2Dd1gcZ6zw7nnUiU3C1HABDMwD2L+RyqiPD6M4i2fO
         V28cZEpZ+hdzYbr7ZDLlDW+3EeO1HZNtg5HilrdZzYC0gF3O+ZJZlKJyVmj9Y7jpGBKx
         IiUQ==
X-Forwarded-Encrypted: i=1; AL+hErFnkuM4zdhAszi4yPVKRTi8BaKXjTVAazHvjsjGPREvj7YSH58GCoDQMYquY9ygfU+fppGKQFwkUJKK1Sac@vger.kernel.org
X-Gm-Message-State: APuU4Z/hGDhEV+xihzc1Kmsk7/b8speii2/5ANieDJvl3ZcvGX0HtBB1
	rAK8WdfFIrAzPDpY1Os/5qbkdv+oMFl4FEGz7+rX7pTjHDMYHcaFWJW5H7tRWKu/wAVK0UPTOVn
	xEBWA6DVZiviBFwmp9yVi4G6QIj1RoQrT5ZuAs4hZyo//+1369WVgUT+8uguOX0FBtfbANGY+IB
	Z+UASGMJTlER4VXf1Py0QLG7MfHFxJ6RDuFfgGOf/of9I=
X-Gm-Gg: AYBFou03vYGe8AAZ/GMTNG8af9bMQQhKrHapUNj89TQRtUvHXqUnp0CkzsPp2srfd9Q
	WHP3ndOpCgWLnp4Y9s9wWXP0nHFOfxQ8JtIpA8Fs3hqMu3MRewTc7QSvJwUzjxIc4pn4lsCbU0K
	IGYFeottXo8EZv2FpdY0dTSGp5VFDtBjFcWKf6ANyiiV5ufbbXCHdkecazu0BTpQ+g3wCGOiHfw
	LioRyjrGn6p7GJC8qNnxW9NguyKRKN3Kj4ug6aa8JrLVicA7kwG1RnNUc3wmfmfh1mj8Tf3SMU=
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id af79cd13be357-94784201bc5mr489628085a.19.1794216956250;
        Mon, 09 Nov 2026 01:35:56 -0800 (PST)
X-Received: by 2002:a05:620a:4381:b0:939:944b:2814 with SMTP id
 af79cd13be357-94784201bc5mr489626285a.19.1794216955763; Mon, 09 Nov 2026
 01:35:55 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-2-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:35:44 +0100
X-Gm-Features: AclHuK_kRS6_i-mtkKs6t_W1vede9PNYOgkyMo3-4PjlVizTB2VyTP2OY2wOt6E
Message-ID: <CAFEp6-2L36F=Q59zEHU_6q-atG8=aU4je4OYOF_CTSTjek0VdA@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] media: qcom: camss: Introduce SOF sequence tracking
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfXz9D/F3wh0SBm
 uwqr+MmOIPPnqf0HZD6akaGloG/YrSaGZgX82vy63Co6+/IfFLwUCIuTktg+K7cEcsOUo+SNTWk
 mIGYEvWlB6nSYX2zNwGOy8ZSCTGjW+cE/VhbVAoLklHMCBbpOEns5KgpG4hSNC2qHxTXSabZKUc
 UQ9sFz6BKHAvDMwsRM0GXAlrAxkA67IQSapurIC55Fdi9xKUBJgjxXntAEem+UP1ddmvu+Uuupy
 9z4FXXNGHypSMY+YPD7FnG4LAZ8dDlK6gmTGPI5mTx4xMvAVCiYHzkLYWTUN6yjVOz6sloba1er
 xrkT1IMdMKQkQMnKm9Et3SaPqVXIiKcRan3iGmZOA1gL8ySY+0HkULU9f3z+7aV0WYMxkHMR+12
 mKzg1rHeoqgtwaB2nlVWhkbDz0xTd4+X5QHXT8C+NALrGMGP+0HRI7eq4shBDEk52tQe7OhMEQu
 Ud9t6oghQQHccnkHhEg==
X-Proofpoint-ORIG-GUID: Dmz-v30fu025LG3HQh3VShTzqaPm93-c
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af193fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ySw4tsHwzHfE-Ekmi8kA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOCBTYWx0ZWRfX65cWgb08lYGR
 adQQiHW5yWRKm9zNEqPvkTpaBuIU8Kp2ftIFlWjPAvacqBdfBl+at5w9HWo1CgSG1GsI910K/hx
 TrZFAcqAsuO8MeNgACWRy+5EN0mQvtI=
X-Proofpoint-GUID: Dmz-v30fu025LG3HQh3VShTzqaPm93-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090038

On Sat, Nov 7, 2026 at 2:01=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> In order to communicate to user-space CSI2 SOF events we will need to hoo=
k
> into and control v4l2_ctrl_subdev_subscribe_event. In-line with other
> implementations of FRAME_SYNC have CSI decoders which support the event
> always generate it in our case if and only if an atomic user count
> indicates it should be so.
>
> A flag in the CSID descriptor indicates if frame_sync_en is supported so
> for each SoC that supports it this flag should be true. Since bool is fal=
se
> by default no negative enumeration of existing or in-flight CSID is
> required.
>
> Subsequent patches will enable on a per-CSID basis.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid.c | 54 ++++++++++++++++++++=
+++++-
>  drivers/media/platform/qcom/camss/camss-csid.h | 12 ++++++
>  2 files changed, 65 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index a00791b00feb7..7f33fb81ca8cc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -760,6 +760,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
>  static int csid_set_stream(struct v4l2_subdev *sd, int enable)
>  {
>         struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +       unsigned int i;
>         int ret;
>
>         if (enable) {
> @@ -778,6 +779,10 @@ static int csid_set_stream(struct v4l2_subdev *sd, i=
nt enable)
>         }
>
>         if (csid->phy.need_vc_update) {
> +               /* Set to -1 as we want to do atomic_inc_return to read *=
/
> +               for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> +                       atomic_set(&csid->sof_seq[i], -1);
> +
>                 csid->res->hw_ops->configure_stream(csid, enable);
>                 csid->phy.need_vc_update =3D false;
>         }
> @@ -1316,9 +1321,56 @@ static int csid_link_setup(struct media_entity *en=
tity,
>         return 0;
>  }
>
> +static int csid_frame_sync_add(struct v4l2_subscribed_event *sev, unsign=
ed int elems)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_inc(&csid->frame_sync_users);
> +
> +       return 0;
> +}
> +
> +static void csid_frame_sync_del(struct v4l2_subscribed_event *sev)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(vdev_to_v4l2_sub=
dev(sev->fh->vdev));
> +
> +       atomic_dec(&csid->frame_sync_users);
> +}
> +
> +static const struct v4l2_subscribed_event_ops csid_frame_sync_ops =3D {
> +       .add =3D csid_frame_sync_add,
> +       .del =3D csid_frame_sync_del,
> +};
> +
> +static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *=
fh,
> +                               struct v4l2_event_subscription *sub)
> +{
> +       struct csid_device *csid =3D v4l2_get_subdevdata(sd);
> +
> +       if (sub->type !=3D V4L2_EVENT_FRAME_SYNC)
> +               return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
> +
> +       if (!csid->res->frame_sync_en)
> +               return -EINVAL;
> +
> +       return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
> +}
> +
> +void csid_sof_event(struct csid_device *csid, unsigned int id)
> +{
> +       struct v4l2_event event =3D {
> +               .type =3D V4L2_EVENT_FRAME_SYNC,
> +               .u.frame_sync.frame_sequence =3D
> +                       atomic_inc_return(&csid->sof_seq[id]),
> +       };
> +
> +       if (atomic_read(&csid->frame_sync_users))
> +               v4l2_event_queue(csid->subdev.devnode, &event);
> +}
> +
>  static const struct v4l2_subdev_core_ops csid_core_ops =3D {
>         .s_power =3D csid_set_power,
> -       .subscribe_event =3D v4l2_ctrl_subdev_subscribe_event,
> +       .subscribe_event =3D csid_subscribe_event,
>         .unsubscribe_event =3D v4l2_event_subdev_unsubscribe,
>  };
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac8..a9d88909d37fc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -141,6 +141,7 @@ struct csid_hw_ops {
>
>  struct csid_subdev_resources {
>         bool is_lite;
> +       bool frame_sync_en;
>         const struct csid_hw_ops *hw_ops;
>         const struct parent_dev_ops *parent_dev_ops;
>         const struct csid_formats *formats;
> @@ -167,6 +168,8 @@ struct csid_device {
>         struct v4l2_ctrl_handler ctrls;
>         struct v4l2_ctrl *testgen_mode;
>         const struct csid_subdev_resources *res;
> +       atomic_t frame_sync_users;
> +       atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
>  };
>
>  struct camss_subdev_resources;
> @@ -248,4 +251,13 @@ u32 csid_hw_version(struct csid_device *csid);
>  u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
>                       unsigned int match_format_idx, u32 match_code);
>
> +/*
> + * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
> + * @csid: CSID device
> + * @id: CSID src-stream ID
> + *
> + *  Called from the CSID interrupt handler on SOF of the path driving th=
e event.
> + */
> +void csid_sof_event(struct csid_device *csid, unsigned int id);
> +
>  #endif /* QC_MSM_CAMSS_CSID_H */
>
> --
> 2.56.0
>
