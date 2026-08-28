Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4883BBFD3
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 07:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787901968; cv=none; b=OQgfvuCyP2IAymPmSQonie2d+ebuP3MQnVdSJ3MOi+UJzrl7iq3dEjdQ3QeurtIryv1Z3EkkXGLUOMog/xmAU2fGMh5nPusS1FMN3prDkKycgu6MahDPyt69NqOP59w/PQMHIjptaRVdkJaXopDqb0YNWrptS/82Wt0M8StuHQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787901968; c=relaxed/simple;
	bh=pjp4l55TcSvtQ0qk1M8HaIkpbfVrhCBR046DcCeU/U4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=W7ax24N8IamZJDbr3xCndeiM6ejmJbuodlTvSCTpUwUQs8Bn4Tx82rYEFmOqfbvrFAHWlUXi6ghoHW9Z/Mg9mxeaQVQs1L0lPCAg8sQfCOEi5L1DLO/U9AUdWaCTHX9IfBJJvuwbqMizPT/7zqJLfcINRMRIc9p0rYiWeUG91YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I+SYkX0B; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I+SYkX0B"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2020421077so83117566b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 00:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1787901964; x=1788506764; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=I+SYkX0BBTu0luCT2xd+fEbQw66drIePy8DC415z35QxHhV3ItAx7fWIzpUIli06GL
         euChHQtGcW1+M/8hEGGzbfOqdhGbr/wZ6Zj+igukZS0w0XZOlnXA3Kaj20S2/nImHVe1
         idfy27Wg1LXZFAOXnnsGuiOsyO9PU6JxdgfCqTyFlBCyW5BnIq5ql7JJDK6IkHzTEcF+
         Y1SbRAe2ot7BwRD747CRHxX389f+t4X6JJf5U1MyrfkZviEIy9lRX7zlA9ZgKlgQJQpr
         2GJ8cTrrbCixjbUhENtP8uWmqL/VoQp37ujMnbodA9ZEK0nIyqdRw83Nwtp2CR9vttma
         ldmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787901964; x=1788506764;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zT7X/XiN8cWELBs01ki64OmNK2wItsswFcyj5x5QOQ=;
        b=FYz6P2BKmXuLI2z91ycgxDOI/YvocwiYaSezi4gA6E2m/A1NcyQx9/SlFUd2+eo8p4
         NJv8q/Sf/oAkkPwBnDXNO1AKKiUOXsc7j63abK91vrVVRJMUi2D+HopzYG1Ow54hRyzG
         bxr9iceq9A9Spjr2KhXrHeCS/hT6PX3toj7wXy5OrZNvnoS94CGmKqBWbvdzmswz+0/P
         mRVVx6yZQnnVb7ZllWHABC7QCMKX5hX9hBf5x7EM5AS1T86Ic1JKPRLHg9X8pwM93Zb2
         nh3OdzWZeTcAK8u+1DsnRdYcG753aOY2WlKFubPfbcXuwWIdTTFBb3jGwy6Sbcvt8kbj
         Zo5w==
X-Forwarded-Encrypted: i=1; AHgh+RqZQ+mzFtg7rLOSJ3kGOdQ/z1IFBOPlkKgKceI00nQBdJPrpu7TJ2GjAH4/r9B9gwgOAvnw6SQOwvR93kwF@vger.kernel.org
X-Gm-Message-State: AFuF++k8nEJSScnYggXxLJKZ7YXmxbJvrQc+f7GE17qDSA5+QSRN9PJz
	dB0EhwCbfgb2afVldy8I/++U0tiJaQ/M8MDav77ADVwwO3ZynG5PyDqG4XneTyJuz8E=
X-Gm-Gg: AR+sD12YaqFvz9+aJy9LdNm+sG/2i8BZH5I+95kNLgH5wzBywQeff0kkWqgqjKtH/yc
	NfWawuu5iSHKGkESjnJJVgokbvV+CfLsGwnt+GHDBTt6G6Cy/BXtKCnkYp7wLnRZ+X/QF62XPuk
	67fMrJr2c0tL2QwOe9q5R9M6qwAJ4nV0XzI2NqE+WSdVKOrc98lEjn3DZDlM82oSieROg6uIC6G
	71qbFYNdBYybLajWakKGKmgwF3zx1DjAg0ghbzHX2RpVWVJYnlEcWnNu6O2Gyvo0KxBtWjReXT7
	P/Kq1OvULrm/yi07IwAbXfHK1YFSU+kOIkKdePa+Ap4s/z3ZRUHQnm2huCYtOCWk2YpCuD8gh+b
	O1zMqcGPyzzxLJf/SsYIzwXaAiTnarM19Faj23MqqYJ/hASPmbaOzCW82cCsQvqxs/uC8CaaCOx
	uYR8ZoLCAhMch8kHSiMI5ItTVRjMkm930BzauCTihGips+P+qt1ugCLy2HhiGA3KaD88vHdnFGS
	u6kDyVtXV6oDYUN+zZHp6ch0atgZWGy/w==
X-Received: by 2002:a17:907:c08c:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2557423bfemr308843566b.23.1787901964423;
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09f4dsm50367266b.6.2026.08.28.00.26.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 00:26:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 09:26:03 +0200
Message-Id: <DL0ECN3CA1GR.3P0BIK580UYDV@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Kristian Brox" <isyourbrainfoss@proton.me>, "Luca Weiss"
 <luca.weiss@fairphone.com>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>, "David Heidelberg" <david@ixit.cz>,
 <oe-linux-nfc@lists.linux.dev>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 0/3] nfc: st-nci: Fairphone 5 NFC bring-up (ST21NFCD)
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260820-fp5-st21nfcd-v3-v3-0-5ee0a7f44d04@proton.me>
 <DKUIKHDS44LA.10CHEGZHLQSNS@fairphone.com>
 <20260823194152.501107-1-isyourbrainfoss@proton.me>
In-Reply-To: <20260823194152.501107-1-isyourbrainfoss@proton.me>

Hi Kristian,

On Sun Aug 23, 2026 at 9:42 PM CEST, Kristian Brox wrote:
> Hi Luca,
>
> On Fri, Aug 21, 2026 at 11:28:22 +0200, Luca Weiss wrote:
>> Can you please confirm how you tested this on your side, and if I'm
>> maybe missing some parts?
>
> Cover letter tests were postmarketOS, these changes as modules on
> 7.1.2: nfctool -d nfc0 -1 -p on an NTAG 215, then neard for NDEF.
> No extra firmware or userspace on top of the three patches.
>
> That 7.1.2 dmesg already had
>
>   nci_ntf_packet: unsupported ntf opcode 0xf02
>
> I treated a found tag as enough and did not mention it. I have a
> driver change so that NTF is handled; I'll send it in v4. The ndlc:
> dumps are debug prints.
>
> I also ran nfctool -d nfc0 -1 -p on a locally built 7.2.0 kernel
> (sc7280-mainline, with that handler): no 0xf02 line, a Type 2 tag
> in about 0.13 s, and Ctrl-C with no tag still left Powered: Yes.
>
> I have not reproduced an error after Ctrl-C with nfctool on that
> kernel. If you have the nfctool and dmesg lines from the second
> start, that would help.

I tried again a bit more yesterday and saw the same behavior. For a few
tag scans it appears fine (apart from the bunch of errors in dmesg), but
after playing around more, I again got the NFC stack into a state where
no further tag scans were possible.

I've scanned both a standard r/w NFC tag (ISO 14443-3A, NXP - NTAG216),
and sometimes my Android phone, which also got recognized as tag.

Looking forward to testing v4.

Regards
Luca

>
> Regards
> Kristian

