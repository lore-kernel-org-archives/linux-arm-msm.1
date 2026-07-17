Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71DC39183A
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784318236; cv=pass; b=Huhj/ds+JCepAELfjtYLqEe1eL5UsVrM8LRHfUYWPr0Px8mAA/YI8owh1V0CkIpfPiknkLG5e3Hi05gKP5Ja0STxNLeUDQ7ctHmTDTZ4IfmNlRxLi4vR3wyTQ+4wy9Z9HKU+H7cwahq9PEJmHC7AN0T/AJBhPnRxPkKz1kqdki4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784318236; c=relaxed/simple;
	bh=uuOeXfineAaSKEkzm9ZAfY9YAcij/EcCbR2zNaGpEpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktFDmYhqYjlkoqRLE/KdxDR3PWvkGjIEriW2wmYewWYbOHCub3V2o38Q4lMBbp84WC6X9UxqK2C/XdQIjwpSCPVxqtjjwX5R8vx+RKgJu38nU4Bi98ZYRcbdIzk2wufdI3R+papCHk2iIdpe3ExylHK4/723nkRaCNsPnsY9iKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNyTUgU7; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNyTUgU7"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81cac794377so5452267b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 12:57:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784318234; cv=none;
        d=google.com; s=arc-20260327;
        b=dn1stpu76RFCSzdAGjZ8B1dSsmsrrx2e6UR3khDFeR/yeuwntPMW/6X58VHw7XX/Xv
         bUlRHtnNskTjYDi93KgH5E1iwD4+o7AGVz4j+rt8LTlpDfziOdhzRMHPKe3iBycRLmmM
         GvD8kxVi12Zdv+dwHQF7VyPsTFdgtFo/2OkCiZKSRdKAxUw6OwJDlnQ0m65Bi2hq4+N/
         ufrB8xvgNXCaXgCt8mgE4Us9OouKdMo48trF3hETKuOQBSXo91xKTTZpsnIC5S8wS8A/
         nrBwTrT52XDCEOg/UGnFS3G7VLlMb6QirGZs1N6KthzcdVNVe5ZFl/8oOt9dxSac82fc
         CPbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        fh=VW69vqvd6oiUAsNnZmJTiex2GmmuPDNjxh+zAFgnlqU=;
        b=JRky5YUuAEImbadYf5aNbKVeC4MCUsfX7/nCeiFJtMx6337AFP+K/pO2olzPYTLKxP
         tPRFIISB1ZxEPZLPOhiTeG43W33NrumiJzXOARNbcSZRz+Jzc7g9RPslTWJNO9pyb7/R
         QIxkESss00Kt2f9nqWWpwxm7mGJEm9SbSJqnmSKbR6qQmKDCjel1N3oAji4sa8T5dDvu
         8kub8tdgh8m1wwIVIoHiV/RLYoYkLQrre2QW5hgstAh87d+UzdKpYPy7/jrxOJdPehgs
         xtMCD8ShPWnMfzTLqOE94c/9m/v7S4f6Y41tNA5VqjunDouA9Tejbc4fX0Z5vRbotIm2
         aZyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784318234; x=1784923034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        b=eNyTUgU7+U1nHHE1U6fzUA7qpVfYDsJJijHQjAeZO0w1wW7uOJ41TEqaFbAzE+BS+d
         d09C3s/Z1dhWrBSqEyF03kqvbjLIM/edSCUE8o7HIPrVfHsJvTKWnC0huxT1dLsXvjGn
         LJDMiEJleiYcAZp2TTXA+q+tgxucslh4QgJdjVLJtCuTeWKyzrDDMc2HjSFsOLGMks90
         9IM6kIdiSI+vno4ut+CVj8hnqDRSLWEBll2k3SovxxUB0KsyTsP9x534BwlcxY8YCpUt
         +yXwacWfP/aKsYHUvFPncVjv3mlzzSLzO0FuCyiEdBnHVOqmtB/pZk4GKbzV2qPP2cmI
         xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784318234; x=1784923034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4r4qpI7ZYUqwhCzIi/TmFSyDrOhyXUmyBS8Pxgob6U=;
        b=LRCUr4KGEAnGntuIG2szV1y5mdKFVBIYv3wlIOxl2Vtb9MNfsL2EEWgehTvLPWktX0
         3F5vUc2Q0fwRfBLKoi5KM/vbbi2P4/uNFU/1XCglfzJ+yh4Q+YGwTLr64Tcq0jhCBFWG
         04LcluJo1iMBjiBcyP9K0hhBlXFQpbie655He9/0AvqD7VmsOdFvaWgl+whmHOIy4+Jt
         1HmoPYyHD6HAlEoUyGYYW7OEjki7Uhzv0udxagXdxPcpM3Kgg42MqPCEMVX/f9qm1eeX
         5RcXvioEBvqFJ8IeEjaoYLyHmYil+gqJ/RwPzQdfXXsOWzkhBjrl1Bk4dsu8rS33fG0A
         IprQ==
X-Forwarded-Encrypted: i=1; AHgh+RpwGBNzJQnlTP9rLP/ajz8AOow4kGT7O2xldfV+eCkXu6XRGOcNaooGNfmdT78V58KyySphX41qjcCXQT6g@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqg2SZcyQYaLfBTOzwfTj/uHL0vo0hkc8QdoSj4CwNOzU1Teln
	l6Ckf8ljl7cw6qJU3kqMFXcMFZBpuD/JuiaMwNMEgOVcsNNJY8XpCdMwCoCA+wy143Z/4f9JJMR
	e4tVTfRSlXVz+kCoT9DzoSlMHQMQamMw=
X-Gm-Gg: AfdE7cn0JPHWzp1Yzm2piOs1+fzmEmTNd5aIpAZK0ApUd0WFzGsZXt3OQ5SdzqfyoGU
	ZqKvh7+3HUkWucMal3lFDWgQGrAdwMSTUp6c6Vk2NVyMMD/rSKvlKlrJr7Favl9+an4mIttPYtL
	m6DZnOP28Oq6WIMqiMKze1ZR7lAUmvy6zR9V4aGUwBNsywphneQ/9KSgS4qnGV3LTtfz4oRfIsS
	lEe5YfCsxYc1bsfpIr38GGMqoTHgsAvIk1J6WBnFRkbOVEcX4bFb2eMCkSy4IQcPLUcib5+E7k=
X-Received: by 2002:a05:690c:60c3:b0:80d:8bad:2ceb with SMTP id
 00721157ae682-81ef217a008mr13797247b3.0.1784318233761; Fri, 17 Jul 2026
 12:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710194638.1502-1-saileshnandanavanam@gmail.com> <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com>
In-Reply-To: <bc13f78b-287c-4832-b2f1-a68e7b35b57d@oss.qualcomm.com>
From: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
Date: Sat, 18 Jul 2026 01:27:09 +0530
X-Gm-Features: AUfX_mybpP0ipFenvhQ7910IFz9oFbDJFCxR2LMB6JHjtp_vKzBdXraXDoqWrzE
Message-ID: <CAF+TLO0F9jQ0+pPei7iFDqcC-gKd44gc5SXa-o_dBKzNsHKU=g@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_mss: Fix off-by-one error in
 regulator error cleanup
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	quic_akdwived@quicinc.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 7/17/26 3:01 PM, Konrad Dybcio wrote:
> The first two labels only unwind a single regulator

Thanks for taking a look. Could you clarify whether this is a
correctness concern (e.g. the fallthrough from err_enable/err_set_load
into err_set_voltage not doing what you'd expect), or more a
structural/style preference (e.g. avoiding three chained labels in
favor of a different approach)? Happy to send a v2 once I understand
what you'd like changed.

Thanks,
Sailesh


On Fri, Jul 17, 2026 at 3:01=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/10/26 9:46 PM, Sailesh Nandanavanam wrote:
> > In q6v5_regulator_enable(), when any operation fails for regulator at
> > index 'i', the error cleanup path unconditionally calls
> > regulator_disable() starting from index 'i'. However, regulator 'i'
> > was never successfully enabled at this point, resulting in an
> > unbalanced disable.
> >
> > There are three distinct failure points:
> > - regulator_set_voltage() failure: voltage was never set, load was
> > never set, regulator was never enabled.
> > - regulator_set_load() failure: voltage was set, but regulator was
> > never enabled.
> > - regulator_enable() failure: voltage and load were set, but
> > regulator was never enabled.
> >
> > Fix this by introducing three separate error labels to handle each
> > failure point correctly. For the failing regulator at index 'i',
> > only reset the resources that were actually configured, without
> > calling regulator_disable(). Then roll back all previously enabled
> > regulators using 'i--' in the for loop initializer to skip the
> > never-enabled regulator.
> >
> > Fixes: 19f902b53b47 ("remoteproc: qcom: Initialize and enable proxy and=
 active regulators.")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Sailesh Nandanavanam <saileshnandanavanam@gmail.com>
> > ---
>
> [...]
>
> > -err:
> > -     for (; i >=3D 0; i--) {
> > +err_enable:
> > +     if (regs[i].uA > 0)
> > +             regulator_set_load(regs[i].reg, 0);
> > +err_set_load:
> > +     if (regs[i].uV > 0)
> > +             regulator_set_voltage(regs[i].reg, 0, INT_MAX);
>
> The first two labels only unwind a single regulator
>
> Konrad
